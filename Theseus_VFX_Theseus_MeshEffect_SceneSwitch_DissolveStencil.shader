//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/Theseus_MeshEffect_SceneSwitch_DissolveStencil" {
Properties {

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("剔除模式", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("深度写入", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("深度测试", Float) = 4.0

[Header(Noise)] _Noise ("扰动纹理", 2D) = "black" { }

_Noise_Speed_Intensity ("XY:扰动流速 ZW:扰动强度", Vector) = (0,0,1,1)

[Header(Dissolve)] _DissolveTex ("溶解纹理", 2D) = "white" { }

[Enum(LeftRight,0,DownUp,1)] _Dissolve_Dir ("溶解UV方向", Float) = 0.0

_Dissolve_Dir_Weight ("UV方向权重", Range(0, 100)) = 1.0

_DissolveStep ("溶解进度", Range(0, 1)) = 0.0

_Dissolve_SpeedU ("溶解流速_U", Float) = 0.0

_Dissolve_SpeedV ("溶解流速_V", Float) = 0.0

[Header(Stencil)] _Stencil_Ref ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _Stencil_Comp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _Stencil_Pass ("StencilPass", Float) = 2.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 6384
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
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _Noise_ST;
uniform 	vec4 _Noise_Speed_Intensity;
uniform 	float _Dissolve_SpeedU;
uniform 	float _Dissolve_SpeedV;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _Dissolve_Dir_Weight;
uniform 	mediump float _DissolveStep;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Speed_Intensity.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_0 = texture(_Noise, u_xlat0.xy).x;
    u_xlat2.xy = vec2(_Dissolve_SpeedU, _Dissolve_SpeedV) * _Time.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = vec2(u_xlat16_0) * _Noise_Speed_Intensity.zw + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb2.xy = equal(vec4(_Dissolve_Dir), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1 = (u_xlatb2.x) ? vs_TEXCOORD0.x : 1.0;
    u_xlat16_1 = (u_xlatb2.y) ? vs_TEXCOORD0.y : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * _Dissolve_Dir_Weight + u_xlat16_0;
    u_xlat16_3 = _Dissolve_Dir_Weight + 1.0;
    u_xlat16_1 = u_xlat16_1 / u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + (-_DissolveStep);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _Noise_ST;
uniform 	vec4 _Noise_Speed_Intensity;
uniform 	float _Dissolve_SpeedU;
uniform 	float _Dissolve_SpeedV;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _Dissolve_Dir_Weight;
uniform 	mediump float _DissolveStep;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Speed_Intensity.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_0 = texture(_Noise, u_xlat0.xy).x;
    u_xlat2.xy = vec2(_Dissolve_SpeedU, _Dissolve_SpeedV) * _Time.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = vec2(u_xlat16_0) * _Noise_Speed_Intensity.zw + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlatb2.xy = equal(vec4(_Dissolve_Dir), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1 = (u_xlatb2.x) ? vs_TEXCOORD0.x : 1.0;
    u_xlat16_1 = (u_xlatb2.y) ? vs_TEXCOORD0.y : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * _Dissolve_Dir_Weight + u_xlat16_0;
    u_xlat16_3 = _Dissolve_Dir_Weight + 1.0;
    u_xlat16_1 = u_xlat16_1 / u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + (-_DissolveStep);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _Noise_ST;
uniform 	vec4 _Noise_Speed_Intensity;
uniform 	float _Dissolve_SpeedU;
uniform 	float _Dissolve_SpeedV;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _Dissolve_Dir_Weight;
uniform 	mediump float _DissolveStep;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Speed_Intensity.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_0 = texture2D(_Noise, u_xlat0.xy).x;
    u_xlat2.xy = vec2(_Dissolve_SpeedU, _Dissolve_SpeedV) * _Time.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = vec2(u_xlat10_0) * _Noise_Speed_Intensity.zw + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlatb2.xy = equal(vec4(_Dissolve_Dir), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1 = (u_xlatb2.x) ? vs_TEXCOORD0.x : 1.0;
    u_xlat16_1 = (u_xlatb2.y) ? vs_TEXCOORD0.y : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * _Dissolve_Dir_Weight + u_xlat10_0;
    u_xlat16_3 = _Dissolve_Dir_Weight + 1.0;
    u_xlat16_1 = u_xlat16_1 / u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + (-_DissolveStep);
    u_xlatb0 = u_xlat16_1<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
varying highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _Noise_ST;
uniform 	vec4 _Noise_Speed_Intensity;
uniform 	float _Dissolve_SpeedU;
uniform 	float _Dissolve_SpeedV;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _Dissolve_Dir_Weight;
uniform 	mediump float _DissolveStep;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
vec2 u_xlat2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _Noise_Speed_Intensity.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_0 = texture2D(_Noise, u_xlat0.xy).x;
    u_xlat2.xy = vec2(_Dissolve_SpeedU, _Dissolve_SpeedV) * _Time.yy + vs_TEXCOORD0.xy;
    u_xlat0.xy = vec2(u_xlat10_0) * _Noise_Speed_Intensity.zw + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlatb2.xy = equal(vec4(_Dissolve_Dir), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1 = (u_xlatb2.x) ? vs_TEXCOORD0.x : 1.0;
    u_xlat16_1 = (u_xlatb2.y) ? vs_TEXCOORD0.y : u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * _Dissolve_Dir_Weight + u_xlat10_0;
    u_xlat16_3 = _Dissolve_Dir_Weight + 1.0;
    u_xlat16_1 = u_xlat16_1 / u_xlat16_3;
    u_xlat16_1 = u_xlat16_1 + (-_DissolveStep);
    u_xlatb0 = u_xlat16_1<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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