//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_PlaneOutline" {
Properties {

_Text ("【功能需要在摄像机上挂EffectOutlineGenerator脚本才能生效】", Float) = 666.0

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

_Color ("颜色", Color) = (0,0,0,1)

_MainTex ("Texture", 2D) = "white" { }

_MainSpeed ("XY:UV流动速度", Vector) = (0,0,0,0)

_Mask ("Mask", 2D) = "white" { }

_Fire_Noise ("扰动纹理", 2D) = "black" { }

_Fire_Noise_Intensity ("扰动纹理强度", Float) = 0.30000001192092896

_Fire_Noise_Vector ("XY:扰动纹理流速", Vector) = (0,0,0,0)

_Fire_Noise2 ("扰动纹理2", 2D) = "black" { }

_Fire_Noise2_Intensity ("扰动纹理2强度", Float) = 0.30000001192092896

_Fire_Noise2_Vector ("XY:扰动纹理2流速", Vector) = (0,0,0,0)

[Header(Stencil)] _StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
  GpuProgramID 43172
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	int _EffectOutlineGeneratorExist;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MainSpeed;
uniform 	vec4 _Color;
uniform 	vec4 _Fire_Noise_ST;
uniform 	vec2 _Fire_Noise_Vector;
uniform 	float _Fire_Noise_Intensity;
uniform 	vec4 _Fire_Noise2_ST;
uniform 	vec2 _Fire_Noise2_Vector;
uniform 	float _Fire_Noise2_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Fire_Noise;
UNITY_LOCATION(2) uniform mediump sampler2D _Fire_Noise2;
UNITY_LOCATION(3) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat7;
mediump float u_xlat16_7;
float u_xlat10;
mediump float u_xlat16_10;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EffectOutlineGeneratorExist!=2);
#else
    u_xlatb0 = _EffectOutlineGeneratorExist!=2;
#endif
    if(u_xlatb0){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat0.xy = _Time.yy * _MainSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.xy = _Time.yy * _Fire_Noise_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Fire_Noise_ST.xy + _Fire_Noise_ST.zw;
    u_xlat16_7 = texture(_Fire_Noise, u_xlat7.xy).x;
    u_xlat7.x = u_xlat16_7 * 2.0 + -1.0;
    u_xlat2.xy = _Time.yy * _Fire_Noise2_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Fire_Noise2_ST.xy + _Fire_Noise2_ST.zw;
    u_xlat16_10 = texture(_Fire_Noise2, u_xlat2.xy).x;
    u_xlat10 = u_xlat16_10 * 2.0 + -1.0;
    u_xlat10 = u_xlat10 * _Fire_Noise2_Intensity;
    u_xlat7.x = u_xlat7.x * _Fire_Noise_Intensity + u_xlat10;
    u_xlat1.xy = u_xlat7.xx * vec2(0.100000001, 0.100000001) + u_xlat1.xy;
    u_xlat1.x = texture(_GlobalEffOutlineTex, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.100000001);
#else
    u_xlatb1 = u_xlat1.x>=0.100000001;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4 = texture(_Mask, u_xlat4.xy).x;
    u_xlat2.xyz = u_xlat1.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat16_4) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat2.w = u_xlat16_0.w * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	int _EffectOutlineGeneratorExist;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MainSpeed;
uniform 	vec4 _Color;
uniform 	vec4 _Fire_Noise_ST;
uniform 	vec2 _Fire_Noise_Vector;
uniform 	float _Fire_Noise_Intensity;
uniform 	vec4 _Fire_Noise2_ST;
uniform 	vec2 _Fire_Noise2_Vector;
uniform 	float _Fire_Noise2_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Fire_Noise;
UNITY_LOCATION(2) uniform mediump sampler2D _Fire_Noise2;
UNITY_LOCATION(3) uniform mediump sampler2D _GlobalEffOutlineTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat7;
mediump float u_xlat16_7;
float u_xlat10;
mediump float u_xlat16_10;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EffectOutlineGeneratorExist!=2);
#else
    u_xlatb0 = _EffectOutlineGeneratorExist!=2;
#endif
    if(u_xlatb0){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat0.xy = _Time.yy * _MainSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.xy = _Time.yy * _Fire_Noise_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Fire_Noise_ST.xy + _Fire_Noise_ST.zw;
    u_xlat16_7 = texture(_Fire_Noise, u_xlat7.xy).x;
    u_xlat7.x = u_xlat16_7 * 2.0 + -1.0;
    u_xlat2.xy = _Time.yy * _Fire_Noise2_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Fire_Noise2_ST.xy + _Fire_Noise2_ST.zw;
    u_xlat16_10 = texture(_Fire_Noise2, u_xlat2.xy).x;
    u_xlat10 = u_xlat16_10 * 2.0 + -1.0;
    u_xlat10 = u_xlat10 * _Fire_Noise2_Intensity;
    u_xlat7.x = u_xlat7.x * _Fire_Noise_Intensity + u_xlat10;
    u_xlat1.xy = u_xlat7.xx * vec2(0.100000001, 0.100000001) + u_xlat1.xy;
    u_xlat1.x = texture(_GlobalEffOutlineTex, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=0.100000001);
#else
    u_xlatb1 = u_xlat1.x>=0.100000001;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_4 = texture(_Mask, u_xlat4.xy).x;
    u_xlat2.xyz = u_xlat1.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat16_4) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat2.w = u_xlat16_0.w * u_xlat0.x;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	int _EffectOutlineGeneratorExist;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MainSpeed;
uniform 	vec4 _Color;
uniform 	vec4 _Fire_Noise_ST;
uniform 	vec2 _Fire_Noise_Vector;
uniform 	float _Fire_Noise_Intensity;
uniform 	vec4 _Fire_Noise2_ST;
uniform 	vec2 _Fire_Noise2_Vector;
uniform 	float _Fire_Noise2_Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Fire_Noise;
uniform lowp sampler2D _Fire_Noise2;
uniform lowp sampler2D _GlobalEffOutlineTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat7;
lowp float u_xlat10_7;
float u_xlat10;
lowp float u_xlat10_10;
void main()
{
    u_xlatb0 = _EffectOutlineGeneratorExist!=2;
    if(u_xlatb0){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat0.xy = _Time.yy * _MainSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.xy = _Time.yy * _Fire_Noise_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Fire_Noise_ST.xy + _Fire_Noise_ST.zw;
    u_xlat10_7 = texture2D(_Fire_Noise, u_xlat7.xy).x;
    u_xlat7.x = u_xlat10_7 * 2.0 + -1.0;
    u_xlat2.xy = _Time.yy * _Fire_Noise2_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Fire_Noise2_ST.xy + _Fire_Noise2_ST.zw;
    u_xlat10_10 = texture2D(_Fire_Noise2, u_xlat2.xy).x;
    u_xlat10 = u_xlat10_10 * 2.0 + -1.0;
    u_xlat10 = u_xlat10 * _Fire_Noise2_Intensity;
    u_xlat7.x = u_xlat7.x * _Fire_Noise_Intensity + u_xlat10;
    u_xlat1.xy = u_xlat7.xx * vec2(0.100000001, 0.100000001) + u_xlat1.xy;
    u_xlat1.x = texture2D(_GlobalEffOutlineTex, u_xlat1.xy).x;
    u_xlatb1 = u_xlat1.x>=0.100000001;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
    u_xlat2.xyz = u_xlat1.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat10_4) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat10_4 * u_xlat0.x;
    u_xlat2.w = u_xlat10_0.w * u_xlat0.x;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	int _EffectOutlineGeneratorExist;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MainSpeed;
uniform 	vec4 _Color;
uniform 	vec4 _Fire_Noise_ST;
uniform 	vec2 _Fire_Noise_Vector;
uniform 	float _Fire_Noise_Intensity;
uniform 	vec4 _Fire_Noise2_ST;
uniform 	vec2 _Fire_Noise2_Vector;
uniform 	float _Fire_Noise2_Intensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Fire_Noise;
uniform lowp sampler2D _Fire_Noise2;
uniform lowp sampler2D _GlobalEffOutlineTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat4;
lowp float u_xlat10_4;
vec2 u_xlat7;
lowp float u_xlat10_7;
float u_xlat10;
lowp float u_xlat10_10;
void main()
{
    u_xlatb0 = _EffectOutlineGeneratorExist!=2;
    if(u_xlatb0){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    }
    u_xlat0.xy = _Time.yy * _MainSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.xy = _Time.yy * _Fire_Noise_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat7.xy = u_xlat7.xy * _Fire_Noise_ST.xy + _Fire_Noise_ST.zw;
    u_xlat10_7 = texture2D(_Fire_Noise, u_xlat7.xy).x;
    u_xlat7.x = u_xlat10_7 * 2.0 + -1.0;
    u_xlat2.xy = _Time.yy * _Fire_Noise2_Vector.xy + vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Fire_Noise2_ST.xy + _Fire_Noise2_ST.zw;
    u_xlat10_10 = texture2D(_Fire_Noise2, u_xlat2.xy).x;
    u_xlat10 = u_xlat10_10 * 2.0 + -1.0;
    u_xlat10 = u_xlat10 * _Fire_Noise2_Intensity;
    u_xlat7.x = u_xlat7.x * _Fire_Noise_Intensity + u_xlat10;
    u_xlat1.xy = u_xlat7.xx * vec2(0.100000001, 0.100000001) + u_xlat1.xy;
    u_xlat1.x = texture2D(_GlobalEffOutlineTex, u_xlat1.xy).x;
    u_xlatb1 = u_xlat1.x>=0.100000001;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_4 = texture2D(_Mask, u_xlat4.xy).x;
    u_xlat2.xyz = u_xlat1.xxx * _Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat10_4) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat0.x = u_xlat10_4 * u_xlat0.x;
    u_xlat2.w = u_xlat10_0.w * u_xlat0.x;
    SV_Target0 = u_xlat2;
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