//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ScreenSketchNPRPost" {
Properties {

_MainTex ("Texture", 2D) = "white" { }

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 48991
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
out highp vec2 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
out highp vec2 vs_TEXCOORD9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    vs_TEXCOORD2.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = _MainTex_TexelSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(-1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD6.xy = _MainTex_TexelSize.xy * vec2(1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD7.xy = _MainTex_TexelSize.xy * vec2(-1.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = _MainTex_TexelSize.xy * vec2(0.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD0.xy + _MainTex_TexelSize.xy;
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
vec4 ImmCB_0[9];
uniform 	mediump float _SketchIntensity;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
in highp vec2 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD8;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
int u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_8;
highp vec4 phase0_Input0_1[9];
void main()
{
ImmCB_0[0] = vec4(-1.0,-1.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,-2.0,0.0,0.0);
ImmCB_0[2] = vec4(1.0,-1.0,0.0,0.0);
ImmCB_0[3] = vec4(-2.0,0.0,0.0,0.0);
ImmCB_0[4] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(2.0,0.0,0.0,0.0);
ImmCB_0[6] = vec4(-1.0,1.0,0.0,0.0);
ImmCB_0[7] = vec4(0.0,2.0,0.0,0.0);
ImmCB_0[8] = vec4(1.0,1.0,0.0,0.0);
phase0_Input0_1[0].xy = vs_TEXCOORD1;
phase0_Input0_1[1].xy = vs_TEXCOORD2;
phase0_Input0_1[2].xy = vs_TEXCOORD3;
phase0_Input0_1[3].xy = vs_TEXCOORD4;
phase0_Input0_1[4].xy = vs_TEXCOORD5;
phase0_Input0_1[5].xy = vs_TEXCOORD6;
phase0_Input0_1[6].xy = vs_TEXCOORD7;
phase0_Input0_1[7].xy = vs_TEXCOORD8;
phase0_Input0_1[8].xy = vs_TEXCOORD9;
    u_xlat16_0 = float(0.0);
    u_xlat16_4 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat16_5.xyz = texture(_MainTex, phase0_Input0_1[u_xlati_loop_1].xy).xyz;
        u_xlat16_8 = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
        u_xlat16_0 = u_xlat16_8 * ImmCB_0[u_xlati_loop_1].x + u_xlat16_0;
        u_xlat16_4 = u_xlat16_8 * ImmCB_0[u_xlati_loop_1].y + u_xlat16_4;
    }
    u_xlat16_0 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = -abs(u_xlat16_4) + u_xlat16_0;
    u_xlat16_1.xyz = texture(_MainTex, phase0_Input0_1[4].xy).xyz;
    u_xlat16_4 = _SketchIntensity * _EdgeColor.w;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _EdgeColor.xyz;
    u_xlat2.xyz = vec3(u_xlat16_4) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_4 = _SketchIntensity * _BGColor.w;
    u_xlat3.xyz = (-u_xlat16_1.xyz) + _BGColor.xyz;
    u_xlat1.xyz = vec3(u_xlat16_4) * u_xlat3.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD5;
out highp vec2 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
out highp vec2 vs_TEXCOORD9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    vs_TEXCOORD2.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = _MainTex_TexelSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(-1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD6.xy = _MainTex_TexelSize.xy * vec2(1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD7.xy = _MainTex_TexelSize.xy * vec2(-1.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = _MainTex_TexelSize.xy * vec2(0.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD0.xy + _MainTex_TexelSize.xy;
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
vec4 ImmCB_0[9];
uniform 	mediump float _SketchIntensity;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD5;
in highp vec2 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD8;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
int u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump float u_xlat16_8;
highp vec4 phase0_Input0_1[9];
void main()
{
ImmCB_0[0] = vec4(-1.0,-1.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,-2.0,0.0,0.0);
ImmCB_0[2] = vec4(1.0,-1.0,0.0,0.0);
ImmCB_0[3] = vec4(-2.0,0.0,0.0,0.0);
ImmCB_0[4] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(2.0,0.0,0.0,0.0);
ImmCB_0[6] = vec4(-1.0,1.0,0.0,0.0);
ImmCB_0[7] = vec4(0.0,2.0,0.0,0.0);
ImmCB_0[8] = vec4(1.0,1.0,0.0,0.0);
phase0_Input0_1[0].xy = vs_TEXCOORD1;
phase0_Input0_1[1].xy = vs_TEXCOORD2;
phase0_Input0_1[2].xy = vs_TEXCOORD3;
phase0_Input0_1[3].xy = vs_TEXCOORD4;
phase0_Input0_1[4].xy = vs_TEXCOORD5;
phase0_Input0_1[5].xy = vs_TEXCOORD6;
phase0_Input0_1[6].xy = vs_TEXCOORD7;
phase0_Input0_1[7].xy = vs_TEXCOORD8;
phase0_Input0_1[8].xy = vs_TEXCOORD9;
    u_xlat16_0 = float(0.0);
    u_xlat16_4 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat16_5.xyz = texture(_MainTex, phase0_Input0_1[u_xlati_loop_1].xy).xyz;
        u_xlat16_8 = dot(u_xlat16_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
        u_xlat16_0 = u_xlat16_8 * ImmCB_0[u_xlati_loop_1].x + u_xlat16_0;
        u_xlat16_4 = u_xlat16_8 * ImmCB_0[u_xlati_loop_1].y + u_xlat16_4;
    }
    u_xlat16_0 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = -abs(u_xlat16_4) + u_xlat16_0;
    u_xlat16_1.xyz = texture(_MainTex, phase0_Input0_1[4].xy).xyz;
    u_xlat16_4 = _SketchIntensity * _EdgeColor.w;
    u_xlat2.xyz = (-u_xlat16_1.xyz) + _EdgeColor.xyz;
    u_xlat2.xyz = vec3(u_xlat16_4) * u_xlat2.xyz + u_xlat16_1.xyz;
    u_xlat16_4 = _SketchIntensity * _BGColor.w;
    u_xlat3.xyz = (-u_xlat16_1.xyz) + _BGColor.xyz;
    u_xlat1.xyz = vec3(u_xlat16_4) * u_xlat3.xyz + u_xlat16_1.xyz;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
varying highp vec2 vs_TEXCOORD9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    vs_TEXCOORD2.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = _MainTex_TexelSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(-1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD6.xy = _MainTex_TexelSize.xy * vec2(1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD7.xy = _MainTex_TexelSize.xy * vec2(-1.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = _MainTex_TexelSize.xy * vec2(0.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD0.xy + _MainTex_TexelSize.xy;
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
vec4 ImmCB_0[9];
uniform 	mediump float _SketchIntensity;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
int u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump float u_xlat16_8;
highp vec4 phase0_Input0_1[9];
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(-1.0,-1.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,-2.0,0.0,0.0);
ImmCB_0[2] = vec4(1.0,-1.0,0.0,0.0);
ImmCB_0[3] = vec4(-2.0,0.0,0.0,0.0);
ImmCB_0[4] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(2.0,0.0,0.0,0.0);
ImmCB_0[6] = vec4(-1.0,1.0,0.0,0.0);
ImmCB_0[7] = vec4(0.0,2.0,0.0,0.0);
ImmCB_0[8] = vec4(1.0,1.0,0.0,0.0);
phase0_Input0_1[0].xy = vs_TEXCOORD1;
phase0_Input0_1[1].xy = vs_TEXCOORD2;
phase0_Input0_1[2].xy = vs_TEXCOORD3;
phase0_Input0_1[3].xy = vs_TEXCOORD4;
phase0_Input0_1[4].xy = vs_TEXCOORD5;
phase0_Input0_1[5].xy = vs_TEXCOORD6;
phase0_Input0_1[6].xy = vs_TEXCOORD7;
phase0_Input0_1[7].xy = vs_TEXCOORD8;
phase0_Input0_1[8].xy = vs_TEXCOORD9;
    u_xlat16_0 = float(0.0);
    u_xlat16_4 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat10_5.xyz = texture2D(_MainTex, phase0_Input0_1[u_xlati_loop_1].xy).xyz;
        u_xlat16_8 = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
        u_xlat16_0 = u_xlat16_8 * ImmCB_0DynamicIndex(u_xlati_loop_1).x + u_xlat16_0;
        u_xlat16_4 = u_xlat16_8 * ImmCB_0DynamicIndex(u_xlati_loop_1).y + u_xlat16_4;
    }
    u_xlat16_0 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = -abs(u_xlat16_4) + u_xlat16_0;
    u_xlat10_1.xyz = texture2D(_MainTex, phase0_Input0_1[4].xy).xyz;
    u_xlat16_4 = _SketchIntensity * _EdgeColor.w;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + _EdgeColor.xyz;
    u_xlat2.xyz = vec3(u_xlat16_4) * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_4 = _SketchIntensity * _BGColor.w;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + _BGColor.xyz;
    u_xlat1.xyz = vec3(u_xlat16_4) * u_xlat3.xyz + u_xlat10_1.xyz;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
varying highp vec2 vs_TEXCOORD9;
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
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + (-_MainTex_TexelSize.xy);
    vs_TEXCOORD2.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = _MainTex_TexelSize.xy * vec2(1.0, -1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(-1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD6.xy = _MainTex_TexelSize.xy * vec2(1.0, 0.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD7.xy = _MainTex_TexelSize.xy * vec2(-1.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD8.xy = _MainTex_TexelSize.xy * vec2(0.0, 1.0) + in_TEXCOORD0.xy;
    vs_TEXCOORD9.xy = in_TEXCOORD0.xy + _MainTex_TexelSize.xy;
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
vec4 ImmCB_0[9];
uniform 	mediump float _SketchIntensity;
uniform 	mediump vec4 _EdgeColor;
uniform 	mediump vec4 _BGColor;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
int u_xlati1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump float u_xlat16_8;
highp vec4 phase0_Input0_1[9];
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(-1.0,-1.0,0.0,0.0);
ImmCB_0[1] = vec4(0.0,-2.0,0.0,0.0);
ImmCB_0[2] = vec4(1.0,-1.0,0.0,0.0);
ImmCB_0[3] = vec4(-2.0,0.0,0.0,0.0);
ImmCB_0[4] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(2.0,0.0,0.0,0.0);
ImmCB_0[6] = vec4(-1.0,1.0,0.0,0.0);
ImmCB_0[7] = vec4(0.0,2.0,0.0,0.0);
ImmCB_0[8] = vec4(1.0,1.0,0.0,0.0);
phase0_Input0_1[0].xy = vs_TEXCOORD1;
phase0_Input0_1[1].xy = vs_TEXCOORD2;
phase0_Input0_1[2].xy = vs_TEXCOORD3;
phase0_Input0_1[3].xy = vs_TEXCOORD4;
phase0_Input0_1[4].xy = vs_TEXCOORD5;
phase0_Input0_1[5].xy = vs_TEXCOORD6;
phase0_Input0_1[6].xy = vs_TEXCOORD7;
phase0_Input0_1[7].xy = vs_TEXCOORD8;
phase0_Input0_1[8].xy = vs_TEXCOORD9;
    u_xlat16_0 = float(0.0);
    u_xlat16_4 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat10_5.xyz = texture2D(_MainTex, phase0_Input0_1[u_xlati_loop_1].xy).xyz;
        u_xlat16_8 = dot(u_xlat10_5.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
        u_xlat16_0 = u_xlat16_8 * ImmCB_0DynamicIndex(u_xlati_loop_1).x + u_xlat16_0;
        u_xlat16_4 = u_xlat16_8 * ImmCB_0DynamicIndex(u_xlati_loop_1).y + u_xlat16_4;
    }
    u_xlat16_0 = -abs(u_xlat16_0) + 1.0;
    u_xlat16_0 = -abs(u_xlat16_4) + u_xlat16_0;
    u_xlat10_1.xyz = texture2D(_MainTex, phase0_Input0_1[4].xy).xyz;
    u_xlat16_4 = _SketchIntensity * _EdgeColor.w;
    u_xlat2.xyz = (-u_xlat10_1.xyz) + _EdgeColor.xyz;
    u_xlat2.xyz = vec3(u_xlat16_4) * u_xlat2.xyz + u_xlat10_1.xyz;
    u_xlat16_4 = _SketchIntensity * _BGColor.w;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + _BGColor.xyz;
    u_xlat1.xyz = vec3(u_xlat16_4) * u_xlat3.xyz + u_xlat10_1.xyz;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat1.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
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