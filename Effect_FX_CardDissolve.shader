//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_CardDissolve" {
Properties {

[Toggle(OpenCustom)] _OpenCustom ("开启Custom", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_LG_TiSp ("XY:流光流速", Vector) = (0.1,0.1,0,0)

[Header(AddTex)] _AddTex ("叠加纹理", 2D) = "black" { }

_AddMask ("叠加纹理遮罩", 2D) = "white" { }

_Add_Color ("叠加纹理颜色", Color) = (1,1,1,1)

_Add_Intensity ("叠加纹理强度", Float) = 1.0

_AddMask_OffsetU ("遮罩偏移U(Custom:uv1.x)", Float) = 0.0

_AddMask_OffsetV ("遮罩偏移V(Custom:uv1.y)", Float) = 0.0

[Header(Sweep)] _SweepTex ("扫光纹理", 2D) = "black" { }

_Sweep_Color ("扫光颜色", Color) = (1,1,1,1)

_Sweep_Intensity ("扫光强度", Float) = 1.0

_Sweep_OffsetU ("扫光偏移U(Custom:uv1.z)", Float) = 0.0

_Sweep_OffsetV ("扫光偏移V(Custom:uv1.w)", Float) = 0.0

[Header(Dissolve)] _Dissolve_Tex ("R:溶解纹理", 2D) = "black" { }

_DissolveRate ("溶解进度(Custom:uv2.x)", Range(0, 1)) = 0.0

[Header(OtherSettings__________________________________________________________________________________)] [Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 7241
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
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
uniform 	vec4 _Time;
uniform 	mediump float _OpenCustom;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec4 _LG_TiSp;
uniform 	mediump vec4 _AddTex_ST;
uniform 	mediump vec3 _Add_Color;
uniform 	mediump float _Add_Intensity;
uniform 	mediump float _AddMask_OffsetU;
uniform 	mediump float _AddMask_OffsetV;
uniform 	mediump vec4 _SweepTex_ST;
uniform 	mediump vec3 _Sweep_Color;
uniform 	mediump float _Sweep_Intensity;
uniform 	mediump float _Sweep_OffsetU;
uniform 	mediump float _Sweep_OffsetV;
uniform 	mediump vec4 _Dissolve_Tex_ST;
uniform 	mediump float _DissolveRate;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AddTex;
UNITY_LOCATION(3) uniform mediump sampler2D _AddMask;
UNITY_LOCATION(4) uniform mediump sampler2D _SweepTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Dissolve_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _LG_TiSp.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _LG_Color.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity)) + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_2.xyz = texture(_AddTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat1.xy + vec2(_AddMask_OffsetU, _AddMask_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_AddMask, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _Add_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Add_Intensity, _Add_Intensity, _Add_Intensity));
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _SweepTex_ST.xy + _SweepTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(_Sweep_OffsetU, _Sweep_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.zw + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_SweepTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Sweep_Intensity, _Sweep_Intensity, _Sweep_Intensity)) + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD2.x * _OpenCustom;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _DissolveRate;
    u_xlat16_3 = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
    u_xlat0.x = texture(_Dissolve_Tex, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3>=u_xlat0.x);
#else
    u_xlatb0 = u_xlat16_3>=u_xlat0.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = u_xlat0.x;
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
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_COLOR0;
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
uniform 	vec4 _Time;
uniform 	mediump float _OpenCustom;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec4 _LG_TiSp;
uniform 	mediump vec4 _AddTex_ST;
uniform 	mediump vec3 _Add_Color;
uniform 	mediump float _Add_Intensity;
uniform 	mediump float _AddMask_OffsetU;
uniform 	mediump float _AddMask_OffsetV;
uniform 	mediump vec4 _SweepTex_ST;
uniform 	mediump vec3 _Sweep_Color;
uniform 	mediump float _Sweep_Intensity;
uniform 	mediump float _Sweep_OffsetU;
uniform 	mediump float _Sweep_OffsetV;
uniform 	mediump vec4 _Dissolve_Tex_ST;
uniform 	mediump float _DissolveRate;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AddTex;
UNITY_LOCATION(3) uniform mediump sampler2D _AddMask;
UNITY_LOCATION(4) uniform mediump sampler2D _SweepTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Dissolve_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _LG_TiSp.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _LG_Color.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity)) + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_2.xyz = texture(_AddTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat1.xy + vec2(_AddMask_OffsetU, _AddMask_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.xy + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_AddMask, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _Add_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Add_Intensity, _Add_Intensity, _Add_Intensity));
    u_xlat0.xyz = u_xlat2.xyz * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _SweepTex_ST.xy + _SweepTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(_Sweep_OffsetU, _Sweep_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.zw + u_xlat1.xy;
    u_xlat16_1.xyz = texture(_SweepTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Sweep_Intensity, _Sweep_Intensity, _Sweep_Intensity)) + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD2.x * _OpenCustom;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _DissolveRate;
    u_xlat16_3 = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
    u_xlat0.x = texture(_Dissolve_Tex, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3>=u_xlat0.x);
#else
    u_xlatb0 = u_xlat16_3>=u_xlat0.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = u_xlat0.x;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
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
uniform 	mediump float _OpenCustom;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec4 _LG_TiSp;
uniform 	mediump vec4 _AddTex_ST;
uniform 	mediump vec3 _Add_Color;
uniform 	mediump float _Add_Intensity;
uniform 	mediump float _AddMask_OffsetU;
uniform 	mediump float _AddMask_OffsetV;
uniform 	mediump vec4 _SweepTex_ST;
uniform 	mediump vec3 _Sweep_Color;
uniform 	mediump float _Sweep_Intensity;
uniform 	mediump float _Sweep_OffsetU;
uniform 	mediump float _Sweep_OffsetV;
uniform 	mediump vec4 _Dissolve_Tex_ST;
uniform 	mediump float _DissolveRate;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _AddTex;
uniform lowp sampler2D _AddMask;
uniform lowp sampler2D _SweepTex;
uniform lowp sampler2D _Dissolve_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _LG_TiSp.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _LG_Color.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity)) + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_AddTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat1.xy + vec2(_AddMask_OffsetU, _AddMask_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.xy + u_xlat1.xy;
    u_xlat10_1.xyz = texture2D(_AddMask, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Add_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Add_Intensity, _Add_Intensity, _Add_Intensity));
    u_xlat0.xyz = u_xlat2.xyz * u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _SweepTex_ST.xy + _SweepTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(_Sweep_OffsetU, _Sweep_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.zw + u_xlat1.xy;
    u_xlat10_1.xyz = texture2D(_SweepTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Sweep_Intensity, _Sweep_Intensity, _Sweep_Intensity)) + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD2.x * _OpenCustom;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _DissolveRate;
    u_xlat16_3 = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
    u_xlatb0 = u_xlat16_3>=u_xlat0.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = u_xlat0.x;
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
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_COLOR0;
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
uniform 	mediump float _OpenCustom;
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _DiffuseColor;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec4 _LG_TiSp;
uniform 	mediump vec4 _AddTex_ST;
uniform 	mediump vec3 _Add_Color;
uniform 	mediump float _Add_Intensity;
uniform 	mediump float _AddMask_OffsetU;
uniform 	mediump float _AddMask_OffsetV;
uniform 	mediump vec4 _SweepTex_ST;
uniform 	mediump vec3 _Sweep_Color;
uniform 	mediump float _Sweep_Intensity;
uniform 	mediump float _Sweep_OffsetU;
uniform 	mediump float _Sweep_OffsetV;
uniform 	mediump vec4 _Dissolve_Tex_ST;
uniform 	mediump float _DissolveRate;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _AddTex;
uniform lowp sampler2D _AddMask;
uniform lowp sampler2D _SweepTex;
uniform lowp sampler2D _Dissolve_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = _Time.yy * _LG_TiSp.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LG_Tex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _LG_Color.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_LG_Intensity, _LG_Intensity, _LG_Intensity)) + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_AddTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat1.xy + vec2(_AddMask_OffsetU, _AddMask_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.xy + u_xlat1.xy;
    u_xlat10_1.xyz = texture2D(_AddMask, u_xlat1.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Add_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_Add_Intensity, _Add_Intensity, _Add_Intensity));
    u_xlat0.xyz = u_xlat2.xyz * u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _SweepTex_ST.xy + _SweepTex_ST.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(_Sweep_OffsetU, _Sweep_OffsetV);
    u_xlat1.xy = vec2(_OpenCustom) * vs_TEXCOORD1.zw + u_xlat1.xy;
    u_xlat10_1.xyz = texture2D(_SweepTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat1.xyz * vec3(vec3(_Sweep_Intensity, _Sweep_Intensity, _Sweep_Intensity)) + u_xlat0.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD2.x * _OpenCustom;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _DissolveRate;
    u_xlat16_3 = (-u_xlat0.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Dissolve_Tex_ST.xy + _Dissolve_Tex_ST.zw;
    u_xlat0.x = texture2D(_Dissolve_Tex, u_xlat0.xy).x;
    u_xlatb0 = u_xlat16_3>=u_xlat0.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    SV_Target0.w = u_xlat0.x;
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