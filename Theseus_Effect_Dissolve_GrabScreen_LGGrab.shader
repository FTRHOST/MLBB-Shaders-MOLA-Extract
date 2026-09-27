//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Effect/Dissolve_GrabScreen_LG(Grab)" {
Properties {

_cull ("剔除模式", Float) = 2.0

_DiffuseColor ("基础色", Color) = (1,1,1,1)

_Diffuse ("基础色贴图", 2D) = "white" { }

_DiffusePower ("基础色强度", Float) = 1.0

_DiffXSpeed ("基础色贴图流动速度X", Float) = 0.0

_DiffYSpeed ("基础色贴图流动速度Y", Float) = 0.0

_GrabPass_MaskStrength ("抓屏遮罩范围", Range(0, 3)) = 1.0

_Opacity ("不透明度", Range(0, 1)) = 1.0

_WarpXMidVal ("X轴偏移值", Range(-2, 2)) = 0.05999999865889549

_WarpYMidVal ("Y轴偏移值", Range(-2, 2)) = 0.05000000074505806

_GrabNoiseXStrength ("抓屏扭曲强度X轴", Range(-1, 1)) = 0.0

_GrabNoiseYStrength ("抓屏扭曲强度Y轴", Range(-1, 1)) = 0.05000000074505806

_WarpInt ("整体偏移强度", Range(-1, 1)) = 0.0

_LG_MaskStrength ("流光遮罩范围", Range(0, 3)) = 1.0

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 2.4000000953674316

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.10000000149011612

_Rongjie_saoguang_liangbian ("R:溶解边缘纹理 B:溶解拖尾", 2D) = "white" { }

_Rongjie_Tiling_Speed ("XY:溶解Tiling ZW:溶解流速", Vector) = (7.75,4.5,0.1,0.3)

_DissolveNoise_Intensity ("溶解扰动强度", Float) = -0.10000000149011612

_Rongjie_Color_Fanwei ("拖尾范围", Float) = 4.0

_DissolveColor_Power ("拖尾强度", Float) = 0.4000000059604645

_DissolveColor ("溶解边缘_颜色", Color) = (1,1,1,1)

_DissolveThreshold ("溶解阈值", Float) = 0.44999998807907104

_Rongjie_Fanwei ("边缘压缩", Float) = 0.8999999761581421

_ClipAmount ("溶解进度", Range(-2, 1)) = 0.12999999523162842

_NoiseTex ("扰动贴图", 2D) = "white" { }

_NoiseEffectDiffStrength ("扰动影响主图强度", Range(0, 1)) = 1.0

[Space(10)] _NoiseXStrength ("扭曲强度U", Range(-10, 10)) = 0.009999999776482582

_NoiseYStrength ("扭曲强度V", Range(-10, 10)) = 0.009999999776482582

_GChannel ("xy:扰动Tiling zw:扰动速度", Vector) = (8.4,4.5,0,0.47)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
 "_GrabTexture"
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 142911
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out mediump float vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 unity_FogColor;
in mediump vec4 vs_COLOR0;
in mediump float vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD0) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out mediump float vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 unity_FogColor;
in mediump vec4 vs_COLOR0;
in mediump float vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD0) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying mediump float vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 unity_FogColor;
varying mediump vec4 vs_COLOR0;
varying mediump float vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD0) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying mediump float vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 unity_FogColor;
varying mediump vec4 vs_COLOR0;
varying mediump float vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = vs_COLOR0.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD0) * u_xlat16_0.xyz + unity_FogColor.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 8585
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
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Rongjie_Fanwei;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _DissolveColor_Power;
uniform 	float _WarpXMidVal;
uniform 	float _WarpYMidVal;
uniform 	mediump float _GrabNoiseXStrength;
uniform 	mediump float _GrabNoiseYStrength;
uniform 	float _WarpInt;
uniform 	float _Opacity;
uniform 	float _DiffusePower;
uniform 	float _DissolveThreshold;
uniform 	mediump vec4 _DissolveColor;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump float _NoiseEffectDiffStrength;
uniform 	mediump float _LG_MaskStrength;
uniform 	mediump float _GrabPass_MaskStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump float u_xlat16_10;
float u_xlat13;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_DissolveColor_Power);
    u_xlat19 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat19 = dot(vec2(u_xlat19), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat19 = u_xlat19 + (-_Rongjie_Fanwei);
    u_xlat2.xy = _Time.yy * _GChannel.zw;
    u_xlat2.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat2.xy;
    u_xlat16_2.x = texture(_NoiseTex, u_xlat2.xy).y;
    u_xlat16_0.xy = u_xlat16_2.xx * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat8.xy = u_xlat16_0.xy * vec2(_DissolveNoise_Intensity);
    u_xlat3.xy = vec2(_NoiseEffectDiffStrength) * u_xlat16_0.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_0.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat3.xy);
    u_xlat8.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat8.xy;
    u_xlat8.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat8.xy;
    u_xlat16_8 = texture(_Rongjie_saoguang_liangbian, u_xlat8.xy).x;
    u_xlat16_4.x = u_xlat19 + u_xlat16_8;
    u_xlat16_10 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = min(u_xlat16_4.x, 3.0);
    u_xlat19 = u_xlat16_4.x + (-_DissolveThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!((-u_xlat19)>=0.0500000007);
#else
    u_xlatb19 = (-u_xlat19)>=0.0500000007;
#endif
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat16_10 * _Rongjie_Color_Fanwei + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat3.x) + 1.0;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat3.y = 0.0;
    u_xlat16_1.x = texture(_Rongjie_saoguang_liangbian, u_xlat3.xy).z;
    u_xlat1.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat8.xyz = u_xlat16_0.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlat16_4.xyz = u_xlat8.xyz * _DiffuseColor.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat16_0.yy + (-vec2(_WarpXMidVal, _WarpYMidVal));
    u_xlat16_22 = u_xlat16_0.w * _DiffuseColor.w;
    u_xlat13 = u_xlat16_22 * _Opacity;
    SV_Target0.w = u_xlat13;
    u_xlat1.xy = u_xlat1.xy * vec2(_WarpInt);
    u_xlat16_5.xy = u_xlat16_2.xx * vec2(_GrabNoiseXStrength, _GrabNoiseYStrength);
    u_xlat8.xy = vs_TEXCOORD1.yy / vec2(_GrabPass_MaskStrength, _LG_MaskStrength);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat8.xz = u_xlat8.xx * u_xlat16_5.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Opacity, _Opacity)) + u_xlat8.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD4.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD4.ww;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat19) + (-u_xlat16_4.xyz);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlat8.xz = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat16_2.xx * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat8.xz;
    u_xlat2.xy = u_xlat2.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_2.xy = texture(_LG_Tex, u_xlat2.xy).xw;
    u_xlat19 = u_xlat16_2.x * u_xlat8.y;
    u_xlat19 = u_xlat19 * _LG_Intensity;
    u_xlat19 = u_xlat16_2.y * u_xlat19;
    SV_Target0.xyz = vec3(u_xlat19) * _LG_Color.xyz + u_xlat1.xyz;
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
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Rongjie_Fanwei;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _DissolveColor_Power;
uniform 	float _WarpXMidVal;
uniform 	float _WarpYMidVal;
uniform 	mediump float _GrabNoiseXStrength;
uniform 	mediump float _GrabNoiseYStrength;
uniform 	float _WarpInt;
uniform 	float _Opacity;
uniform 	float _DiffusePower;
uniform 	float _DissolveThreshold;
uniform 	mediump vec4 _DissolveColor;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump float _NoiseEffectDiffStrength;
uniform 	mediump float _LG_MaskStrength;
uniform 	mediump float _GrabPass_MaskStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
mediump float u_xlat16_8;
mediump float u_xlat16_10;
float u_xlat13;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_DissolveColor_Power);
    u_xlat19 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat19 = dot(vec2(u_xlat19), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat19 = u_xlat19 + (-_Rongjie_Fanwei);
    u_xlat2.xy = _Time.yy * _GChannel.zw;
    u_xlat2.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat2.xy;
    u_xlat16_2.x = texture(_NoiseTex, u_xlat2.xy).y;
    u_xlat16_0.xy = u_xlat16_2.xx * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat8.xy = u_xlat16_0.xy * vec2(_DissolveNoise_Intensity);
    u_xlat3.xy = vec2(_NoiseEffectDiffStrength) * u_xlat16_0.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_0.xy;
    u_xlat16_0 = texture(_Diffuse, u_xlat3.xy);
    u_xlat8.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat8.xy;
    u_xlat8.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat8.xy;
    u_xlat16_8 = texture(_Rongjie_saoguang_liangbian, u_xlat8.xy).x;
    u_xlat16_4.x = u_xlat19 + u_xlat16_8;
    u_xlat16_10 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = min(u_xlat16_4.x, 3.0);
    u_xlat19 = u_xlat16_4.x + (-_DissolveThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!((-u_xlat19)>=0.0500000007);
#else
    u_xlatb19 = (-u_xlat19)>=0.0500000007;
#endif
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat16_10 * _Rongjie_Color_Fanwei + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat3.x) + 1.0;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat3.y = 0.0;
    u_xlat16_1.x = texture(_Rongjie_saoguang_liangbian, u_xlat3.xy).z;
    u_xlat1.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz;
    u_xlat8.xyz = u_xlat16_0.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlat16_4.xyz = u_xlat8.xyz * _DiffuseColor.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat16_0.yy + (-vec2(_WarpXMidVal, _WarpYMidVal));
    u_xlat16_22 = u_xlat16_0.w * _DiffuseColor.w;
    u_xlat13 = u_xlat16_22 * _Opacity;
    SV_Target0.w = u_xlat13;
    u_xlat1.xy = u_xlat1.xy * vec2(_WarpInt);
    u_xlat16_5.xy = u_xlat16_2.xx * vec2(_GrabNoiseXStrength, _GrabNoiseYStrength);
    u_xlat8.xy = vs_TEXCOORD1.yy / vec2(_GrabPass_MaskStrength, _LG_MaskStrength);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat8.xz = u_xlat8.xx * u_xlat16_5.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Opacity, _Opacity)) + u_xlat8.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD4.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD4.ww;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(u_xlat19) + (-u_xlat16_4.xyz);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlat8.xz = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat16_2.xx * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat8.xz;
    u_xlat2.xy = u_xlat2.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_2.xy = texture(_LG_Tex, u_xlat2.xy).xw;
    u_xlat19 = u_xlat16_2.x * u_xlat8.y;
    u_xlat19 = u_xlat19 * _LG_Intensity;
    u_xlat19 = u_xlat16_2.y * u_xlat19;
    SV_Target0.xyz = vec3(u_xlat19) * _LG_Color.xyz + u_xlat1.xyz;
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
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Rongjie_Fanwei;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _DissolveColor_Power;
uniform 	float _WarpXMidVal;
uniform 	float _WarpYMidVal;
uniform 	mediump float _GrabNoiseXStrength;
uniform 	mediump float _GrabNoiseYStrength;
uniform 	float _WarpInt;
uniform 	float _Opacity;
uniform 	float _DiffusePower;
uniform 	float _DissolveThreshold;
uniform 	mediump vec4 _DissolveColor;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump float _NoiseEffectDiffStrength;
uniform 	mediump float _LG_MaskStrength;
uniform 	mediump float _GrabPass_MaskStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
lowp vec2 u_xlat10_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump float u_xlat16_10;
float u_xlat13;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_DissolveColor_Power);
    u_xlat19 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat19 = dot(vec2(u_xlat19), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat19 = u_xlat19 + (-_Rongjie_Fanwei);
    u_xlat2.xy = _Time.yy * _GChannel.zw;
    u_xlat2.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat2.xy;
    u_xlat10_2.x = texture2D(_NoiseTex, u_xlat2.xy).y;
    u_xlat16_0.xy = u_xlat10_2.xx * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat8.xy = u_xlat16_0.xy * vec2(_DissolveNoise_Intensity);
    u_xlat3.xy = vec2(_NoiseEffectDiffStrength) * u_xlat16_0.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_0.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat8.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat8.xy;
    u_xlat8.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat8.xy;
    u_xlat10_8 = texture2D(_Rongjie_saoguang_liangbian, u_xlat8.xy).x;
    u_xlat16_4.x = u_xlat19 + u_xlat10_8;
    u_xlat16_10 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = min(u_xlat16_4.x, 3.0);
    u_xlat19 = u_xlat16_4.x + (-_DissolveThreshold);
    u_xlatb19 = (-u_xlat19)>=0.0500000007;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat16_10 * _Rongjie_Color_Fanwei + (-_Rongjie_Color_Fanwei);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat3.x) + 1.0;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat3.y = 0.0;
    u_xlat10_1.x = texture2D(_Rongjie_saoguang_liangbian, u_xlat3.xy).z;
    u_xlat1.xyz = u_xlat10_1.xxx * u_xlat16_4.xyz;
    u_xlat8.xyz = u_xlat10_0.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlat16_4.xyz = u_xlat8.xyz * _DiffuseColor.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat10_0.yy + (-vec2(_WarpXMidVal, _WarpYMidVal));
    u_xlat16_22 = u_xlat10_0.w * _DiffuseColor.w;
    u_xlat13 = u_xlat16_22 * _Opacity;
    SV_Target0.w = u_xlat13;
    u_xlat1.xy = u_xlat1.xy * vec2(_WarpInt);
    u_xlat16_5.xy = u_xlat10_2.xx * vec2(_GrabNoiseXStrength, _GrabNoiseYStrength);
    u_xlat8.xy = vs_TEXCOORD1.yy / vec2(_GrabPass_MaskStrength, _LG_MaskStrength);
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xz = u_xlat8.xx * u_xlat16_5.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Opacity, _Opacity)) + u_xlat8.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD4.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD4.ww;
    u_xlat10_1.xyz = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat19) + (-u_xlat16_4.xyz);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlat8.xz = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat10_2.xx * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat8.xz;
    u_xlat2.xy = u_xlat2.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_2.xy = texture2D(_LG_Tex, u_xlat2.xy).xw;
    u_xlat19 = u_xlat10_2.x * u_xlat8.y;
    u_xlat19 = u_xlat19 * _LG_Intensity;
    u_xlat19 = u_xlat10_2.y * u_xlat19;
    SV_Target0.xyz = vec3(u_xlat19) * _LG_Color.xyz + u_xlat1.xyz;
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
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	float _LG_Intensity;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _Rongjie_Fanwei;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _DissolveColor_Power;
uniform 	float _WarpXMidVal;
uniform 	float _WarpYMidVal;
uniform 	mediump float _GrabNoiseXStrength;
uniform 	mediump float _GrabNoiseYStrength;
uniform 	float _WarpInt;
uniform 	float _Opacity;
uniform 	float _DiffusePower;
uniform 	float _DissolveThreshold;
uniform 	mediump vec4 _DissolveColor;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump float _NoiseEffectDiffStrength;
uniform 	mediump float _LG_MaskStrength;
uniform 	mediump float _GrabPass_MaskStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _LG_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
lowp vec2 u_xlat10_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
lowp float u_xlat10_8;
mediump float u_xlat16_10;
float u_xlat13;
float u_xlat19;
bool u_xlatb19;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_DissolveColor_Power);
    u_xlat19 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat19 = dot(vec2(u_xlat19), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat19 = u_xlat19 + (-_Rongjie_Fanwei);
    u_xlat2.xy = _Time.yy * _GChannel.zw;
    u_xlat2.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat2.xy;
    u_xlat10_2.x = texture2D(_NoiseTex, u_xlat2.xy).y;
    u_xlat16_0.xy = u_xlat10_2.xx * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat8.xy = u_xlat16_0.xy * vec2(_DissolveNoise_Intensity);
    u_xlat3.xy = vec2(_NoiseEffectDiffStrength) * u_xlat16_0.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = u_xlat3.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat3.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat16_0.xy;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat3.xy);
    u_xlat8.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat8.xy;
    u_xlat8.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat8.xy;
    u_xlat10_8 = texture2D(_Rongjie_saoguang_liangbian, u_xlat8.xy).x;
    u_xlat16_4.x = u_xlat19 + u_xlat10_8;
    u_xlat16_10 = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0);
    u_xlat16_4.x = min(u_xlat16_4.x, 3.0);
    u_xlat19 = u_xlat16_4.x + (-_DissolveThreshold);
    u_xlatb19 = (-u_xlat19)>=0.0500000007;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat16_10 * _Rongjie_Color_Fanwei + (-_Rongjie_Color_Fanwei);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat3.x) + 1.0;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat3.y = 0.0;
    u_xlat10_1.x = texture2D(_Rongjie_saoguang_liangbian, u_xlat3.xy).z;
    u_xlat1.xyz = u_xlat10_1.xxx * u_xlat16_4.xyz;
    u_xlat8.xyz = u_xlat10_0.xyz * vec3(vec3(_DiffusePower, _DiffusePower, _DiffusePower));
    u_xlat16_4.xyz = u_xlat8.xyz * _DiffuseColor.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat10_0.yy + (-vec2(_WarpXMidVal, _WarpYMidVal));
    u_xlat16_22 = u_xlat10_0.w * _DiffuseColor.w;
    u_xlat13 = u_xlat16_22 * _Opacity;
    SV_Target0.w = u_xlat13;
    u_xlat1.xy = u_xlat1.xy * vec2(_WarpInt);
    u_xlat16_5.xy = u_xlat10_2.xx * vec2(_GrabNoiseXStrength, _GrabNoiseYStrength);
    u_xlat8.xy = vs_TEXCOORD1.yy / vec2(_GrabPass_MaskStrength, _LG_MaskStrength);
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat8.xz = u_xlat8.xx * u_xlat16_5.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_Opacity, _Opacity)) + u_xlat8.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD4.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD4.ww;
    u_xlat10_1.xyz = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(u_xlat19) + (-u_xlat16_4.xyz);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlat8.xz = _Time.yy * vec2(_U_LG, _V_LG) + vs_TEXCOORD2.xy;
    u_xlat2.xy = u_xlat10_2.xx * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat8.xz;
    u_xlat2.xy = u_xlat2.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_2.xy = texture2D(_LG_Tex, u_xlat2.xy).xw;
    u_xlat19 = u_xlat10_2.x * u_xlat8.y;
    u_xlat19 = u_xlat19 * _LG_Intensity;
    u_xlat19 = u_xlat10_2.y * u_xlat19;
    SV_Target0.xyz = vec3(u_xlat19) * _LG_Color.xyz + u_xlat1.xyz;
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
 Pass {
 Name "SHADOW_CASTER"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 128922
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat16_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat16_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat10_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat10_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat16_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Rongjie_saoguang_liangbian;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat16_0 = texture(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat16_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat10_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform 	vec4 _Rongjie_Tiling_Speed;
uniform 	float _DissolveNoise_Intensity;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _DissolveThreshold;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Rongjie_saoguang_liangbian;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec2 u_xlat16_1;
float u_xlat2;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD2.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseTex, u_xlat0.xy).y;
    u_xlat16_1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStrength, _NoiseYStrength);
    u_xlat0.xy = u_xlat16_1.xy * vec2(_DissolveNoise_Intensity);
    u_xlat0.xy = vs_TEXCOORD1.xy * _Rongjie_Tiling_Speed.xy + u_xlat0.xy;
    u_xlat0.xy = _Time.yy * _Rongjie_Tiling_Speed.zw + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Rongjie_saoguang_liangbian, u_xlat0.xy).x;
    u_xlat2 = vs_TEXCOORD1.y + _ClipAmount;
    u_xlat2 = dot(vec2(u_xlat2), vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat2 = u_xlat2 + (-_Rongjie_Fanwei);
    u_xlat16_1.x = u_xlat10_0 + u_xlat2;
    u_xlat0.x = u_xlat16_1.x + (-_DissolveThreshold);
    u_xlatb0 = u_xlat0.x<0.0;
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
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Dissolve_GrabScreen_LG_GrabGUI"
}