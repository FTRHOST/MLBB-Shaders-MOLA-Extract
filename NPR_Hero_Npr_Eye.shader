//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_Npr_Eye" {
Properties {

[Header(BaseTexture)] [Space(10)] _MainTex ("Albedo", 2D) = "white" { }

_FunctionTex ("R:高光,G:受SDF影响的区域Mask,B:动画序列帧,A:视察高度图", 2D) = "white" { }

_SDFTex ("SDF纹理", 2D) = "white" { }

[Header(SDF)] [Space(10)] [Toggle] _UseSdf ("Use sdf", Float) = 1.0

_ShadowFeather ("Shadow Feather", Range(0, 1)) = 0.009999999776482582

_LightAreaColor ("Light Area Color", Color) = (1,1,1,1)

_DarkAreaColor ("Shadow Area Color", Color) = (0.5,0.5,0.5,1)

_SpeColor ("Specular Color", Color) = (1,1,1,1)

[Header(Parallax)] [Space(10)] _ParallaxStrength ("眼球视差强弱", Range(-0.35, 0)) = -0.2639999985694885

[Header(Animation)] [Space(10)] [Toggle] _UseEventAnimation ("Event Animation", Float) = 0.0

_AnimationProcess ("Animation Process", Range(0, 1)) = 0.0

_AnimaScaleAndOffset ("Anima Scale and Offset", Vector) = (1,1,0.5,0.5)

_AnimaSpeCol ("Anima Spe Color", Color) = (1,1,1,1)

[Header(Other)] [Space(10)] _boneRight ("勿动,脸部骨骼朝右方向矢量", Vector) = (0,0,1,0)

_boneForward ("勿动,脸部骨骼朝前方向矢量", Vector) = (0,1,0,0)

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 53667
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _SDFTex_ST;
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_VAR_TANGENT0;
mediump  vec4 phase0_Output0_2;
out mediump float vs_VAR_LOCALZ0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec3 vs_NORMAL0;
out mediump vec3 vs_VAR_FRAGMENT0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.w = u_xlat1.y;
    u_xlat16_3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat4.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-in_POSITION0.xyz);
    u_xlat2.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat2.x = dot(in_TANGENT0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    phase0_Output0_2 = u_xlat2;
    u_xlat16_3.x = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_8 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat15 = max(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.x = min(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat1.x = u_xlat15 * u_xlat15;
    u_xlat6 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat1.x * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat1.x * u_xlat6 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat15 * u_xlat1.x;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_8)<abs(u_xlat16_3.x));
#else
    u_xlatb11 = abs(u_xlat16_8)<abs(u_xlat16_3.x);
#endif
    u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_8<(-u_xlat16_8));
#else
    u_xlatb1 = u_xlat16_8<(-u_xlat16_8);
#endif
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat1.x;
    u_xlat1.x = min(u_xlat16_8, u_xlat16_3.x);
    u_xlat6 = max(u_xlat16_8, u_xlat16_3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb6 = u_xlat6>=(-u_xlat6);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb6 && u_xlatb1;
    u_xlat15 = (u_xlatb1) ? (-u_xlat15) : u_xlat15;
    u_xlat1.x = u_xlat15 * 0.318309873;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<0.0);
#else
    u_xlatb15 = u_xlat15<0.0;
#endif
    vs_TEXCOORD2.xy = abs(u_xlat1.xx);
    u_xlat1.xy = in_TEXCOORD1.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_3.xy = (bool(u_xlatb15)) ? u_xlat1.xy : in_TEXCOORD1.xy;
    u_xlat1.xy = u_xlat16_3.xy * _SDFTex_ST.xy + _SDFTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_VAR_FRAGMENT0.xyz = u_xlat0.xyz;
vs_VAR_TANGENT0 = phase0_Output0_2.xyz;
vs_VAR_LOCALZ0 = phase0_Output0_2.w;
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
uniform 	mediump float _AnimationProcess;
uniform 	vec4 _AnimaScaleAndOffset;
uniform 	mediump vec3 _AnimaSpeCol;
uniform 	mediump float _UseEventAnimation;
uniform 	mediump float _ParallaxStrength;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump vec3 _LightAreaColor;
uniform 	mediump vec3 _DarkAreaColor;
uniform 	mediump float _UseSdf;
UNITY_LOCATION(0) uniform mediump sampler2D _FunctionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SDFTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_VAR_TANGENT0;
in mediump float vs_VAR_LOCALZ0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
ivec3 u_xlati1;
uvec3 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
uint u_xlatu4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
int u_xlati8;
uint u_xlatu8;
mediump float u_xlat16_10;
bool u_xlatb11;
mediump vec2 u_xlat16_14;
mediump float u_xlat16_16;
bool u_xlatb18;
uint u_xlatu22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.5;
    u_xlat1.x = u_xlat16_0.y * _AnimaScaleAndOffset.y + _AnimaScaleAndOffset.w;
    u_xlat16_2.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * _AnimaScaleAndOffset.x + _AnimaScaleAndOffset.z;
    u_xlat16_2.y = fract(u_xlat1.x);
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Time.y * 50.0;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.100000001;
    u_xlat16_2.x = sin(u_xlat1.x);
    u_xlat16_3.x = cos(u_xlat1.x);
    u_xlat16_14.xy = u_xlat16_0.xy * u_xlat16_2.xx;
    u_xlat16_2.x = u_xlat16_0.y * u_xlat16_3.x + (-u_xlat16_14.x);
    u_xlat16_2.y = u_xlat16_0.x * u_xlat16_3.x + u_xlat16_14.y;
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.25, 0.25);
    u_xlat16_14.x = _AnimationProcess * 16.0;
    u_xlatu1.x = uint(int(u_xlat16_14.x));
    u_xlatu1.y = uint(u_xlatu1.x ^ 4u);
    u_xlatu1.z = uint(max(int(u_xlatu1.x), (-int(u_xlatu1.x))));
    u_xlatu22 = uint(u_xlatu1.z >> 2u);
    u_xlati1.xyz = ivec3(uvec3(u_xlatu1.x & uint(2147483648u), u_xlatu1.y & uint(2147483648u), u_xlatu1.z & uint(3u)));
    u_xlatu4 = uint(0 - int(u_xlatu22));
    u_xlatu8 = (u_xlati1.y != 0) ? u_xlatu4 : u_xlatu22;
    u_xlat4.y = float(int(u_xlatu8));
    u_xlati8 = 0 - u_xlati1.z;
    u_xlati1.x = (u_xlati1.x != 0) ? u_xlati8 : u_xlati1.z;
    u_xlat4.x = float(u_xlati1.x);
    u_xlat16_0.xy = u_xlat4.xy * vec2(0.25, 0.25) + u_xlat16_0.xy;
    u_xlat16_1 = texture(_FunctionTex, u_xlat16_0.xy).z;
    u_xlat1.xyz = vec3(u_xlat16_1) * _AnimaSpeCol.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<vs_VAR_LOCALZ0);
#else
    u_xlatb22 = 0.0<vs_VAR_LOCALZ0;
#endif
    u_xlat16_4.xyz = texture(_SDFTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_0.x = (-u_xlat16_4.y) + u_xlat16_4.z;
    u_xlat16_0.x = abs(vs_VAR_LOCALZ0) * u_xlat16_0.x + u_xlat16_4.y;
    u_xlat16_0.x = (u_xlatb22) ? u_xlat16_4.x : u_xlat16_0.x;
    u_xlat16_7.x = vs_TEXCOORD2.x + (-_ShadowFeather);
    u_xlat16_0.x = (-u_xlat16_7.x) + u_xlat16_0.x;
    u_xlat16_14.x = vs_TEXCOORD2.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_14.x;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_0.x = u_xlat16_7.x * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_7.x;
    u_xlat16_7.xyz = _LightAreaColor.xyz + (-_DarkAreaColor.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + _DarkAreaColor.xyz;
    u_xlat16_2.x = dot(vs_VAR_TANGENT0.xyz, vs_VAR_TANGENT0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat16_2.xx * vs_VAR_TANGENT0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_ParallaxStrength);
    u_xlat16_4.xyz = texture(_FunctionTex, vs_TEXCOORD0.xy).xyw;
    u_xlat16_16 = (-u_xlat16_4.z) + 1.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_16) + vs_TEXCOORD0.xy;
    u_xlat2 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat5.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_0 = u_xlat2 * u_xlat16_0 + (-u_xlat2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.100000001<u_xlat16_4.y);
#else
    u_xlatb22 = 0.100000001<u_xlat16_4.y;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(vs_TEXCOORD0.w<0.75);
#else
    u_xlatb11 = vs_TEXCOORD0.w<0.75;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.25<vs_TEXCOORD0.w);
#else
    u_xlatb18 = 0.25<vs_TEXCOORD0.w;
#endif
    u_xlatb11 = u_xlatb18 && u_xlatb11;
    u_xlat6 = (u_xlatb11) ? 0.0 : 1.0;
    u_xlat16_3.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat5.x = u_xlat6;
    u_xlat16_10 = (u_xlatb22) ? u_xlat5.x : 0.0;
    u_xlat16_0 = vec4(u_xlat16_10) * u_xlat16_0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseSdf));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseSdf);
#endif
    u_xlat16_0 = (bool(u_xlatb22)) ? u_xlat16_0 : u_xlat2;
    u_xlat16_0.xyz = u_xlat16_4.xxx * _SpeColor.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xxx + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseEventAnimation));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseEventAnimation);
#endif
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _SDFTex_ST;
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec3 vs_VAR_TANGENT0;
mediump  vec4 phase0_Output0_2;
out mediump float vs_VAR_LOCALZ0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
out mediump vec3 vs_NORMAL0;
out mediump vec3 vs_VAR_FRAGMENT0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.w = u_xlat1.y;
    u_xlat16_3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat4.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-in_POSITION0.xyz);
    u_xlat2.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat2.x = dot(in_TANGENT0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    phase0_Output0_2 = u_xlat2;
    u_xlat16_3.x = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_8 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat15 = max(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.x = min(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat1.x = u_xlat15 * u_xlat15;
    u_xlat6 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat1.x * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat1.x * u_xlat6 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat15 * u_xlat1.x;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_8)<abs(u_xlat16_3.x));
#else
    u_xlatb11 = abs(u_xlat16_8)<abs(u_xlat16_3.x);
#endif
    u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_8<(-u_xlat16_8));
#else
    u_xlatb1 = u_xlat16_8<(-u_xlat16_8);
#endif
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat1.x;
    u_xlat1.x = min(u_xlat16_8, u_xlat16_3.x);
    u_xlat6 = max(u_xlat16_8, u_xlat16_3.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb6 = u_xlat6>=(-u_xlat6);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb6 && u_xlatb1;
    u_xlat15 = (u_xlatb1) ? (-u_xlat15) : u_xlat15;
    u_xlat1.x = u_xlat15 * 0.318309873;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<0.0);
#else
    u_xlatb15 = u_xlat15<0.0;
#endif
    vs_TEXCOORD2.xy = abs(u_xlat1.xx);
    u_xlat1.xy = in_TEXCOORD1.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_3.xy = (bool(u_xlatb15)) ? u_xlat1.xy : in_TEXCOORD1.xy;
    u_xlat1.xy = u_xlat16_3.xy * _SDFTex_ST.xy + _SDFTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_VAR_FRAGMENT0.xyz = u_xlat0.xyz;
vs_VAR_TANGENT0 = phase0_Output0_2.xyz;
vs_VAR_LOCALZ0 = phase0_Output0_2.w;
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
uniform 	mediump float _AnimationProcess;
uniform 	vec4 _AnimaScaleAndOffset;
uniform 	mediump vec3 _AnimaSpeCol;
uniform 	mediump float _UseEventAnimation;
uniform 	mediump float _ParallaxStrength;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump vec3 _LightAreaColor;
uniform 	mediump vec3 _DarkAreaColor;
uniform 	mediump float _UseSdf;
UNITY_LOCATION(0) uniform mediump sampler2D _FunctionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SDFTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec3 vs_VAR_TANGENT0;
in mediump float vs_VAR_LOCALZ0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
ivec3 u_xlati1;
uvec3 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
uint u_xlatu4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
int u_xlati8;
uint u_xlatu8;
mediump float u_xlat16_10;
bool u_xlatb11;
mediump vec2 u_xlat16_14;
mediump float u_xlat16_16;
bool u_xlatb18;
uint u_xlatu22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.5;
    u_xlat1.x = u_xlat16_0.y * _AnimaScaleAndOffset.y + _AnimaScaleAndOffset.w;
    u_xlat16_2.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * _AnimaScaleAndOffset.x + _AnimaScaleAndOffset.z;
    u_xlat16_2.y = fract(u_xlat1.x);
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Time.y * 50.0;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.100000001;
    u_xlat16_2.x = sin(u_xlat1.x);
    u_xlat16_3.x = cos(u_xlat1.x);
    u_xlat16_14.xy = u_xlat16_0.xy * u_xlat16_2.xx;
    u_xlat16_2.x = u_xlat16_0.y * u_xlat16_3.x + (-u_xlat16_14.x);
    u_xlat16_2.y = u_xlat16_0.x * u_xlat16_3.x + u_xlat16_14.y;
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.25, 0.25);
    u_xlat16_14.x = _AnimationProcess * 16.0;
    u_xlatu1.x = uint(int(u_xlat16_14.x));
    u_xlatu1.y = uint(u_xlatu1.x ^ 4u);
    u_xlatu1.z = uint(max(int(u_xlatu1.x), (-int(u_xlatu1.x))));
    u_xlatu22 = uint(u_xlatu1.z >> 2u);
    u_xlati1.xyz = ivec3(uvec3(u_xlatu1.x & uint(2147483648u), u_xlatu1.y & uint(2147483648u), u_xlatu1.z & uint(3u)));
    u_xlatu4 = uint(0 - int(u_xlatu22));
    u_xlatu8 = (u_xlati1.y != 0) ? u_xlatu4 : u_xlatu22;
    u_xlat4.y = float(int(u_xlatu8));
    u_xlati8 = 0 - u_xlati1.z;
    u_xlati1.x = (u_xlati1.x != 0) ? u_xlati8 : u_xlati1.z;
    u_xlat4.x = float(u_xlati1.x);
    u_xlat16_0.xy = u_xlat4.xy * vec2(0.25, 0.25) + u_xlat16_0.xy;
    u_xlat16_1 = texture(_FunctionTex, u_xlat16_0.xy).z;
    u_xlat1.xyz = vec3(u_xlat16_1) * _AnimaSpeCol.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<vs_VAR_LOCALZ0);
#else
    u_xlatb22 = 0.0<vs_VAR_LOCALZ0;
#endif
    u_xlat16_4.xyz = texture(_SDFTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_0.x = (-u_xlat16_4.y) + u_xlat16_4.z;
    u_xlat16_0.x = abs(vs_VAR_LOCALZ0) * u_xlat16_0.x + u_xlat16_4.y;
    u_xlat16_0.x = (u_xlatb22) ? u_xlat16_4.x : u_xlat16_0.x;
    u_xlat16_7.x = vs_TEXCOORD2.x + (-_ShadowFeather);
    u_xlat16_0.x = (-u_xlat16_7.x) + u_xlat16_0.x;
    u_xlat16_14.x = vs_TEXCOORD2.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_14.x;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_0.x = u_xlat16_7.x * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_7.x;
    u_xlat16_7.xyz = _LightAreaColor.xyz + (-_DarkAreaColor.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + _DarkAreaColor.xyz;
    u_xlat16_2.x = dot(vs_VAR_TANGENT0.xyz, vs_VAR_TANGENT0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat16_2.xx * vs_VAR_TANGENT0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_ParallaxStrength);
    u_xlat16_4.xyz = texture(_FunctionTex, vs_TEXCOORD0.xy).xyw;
    u_xlat16_16 = (-u_xlat16_4.z) + 1.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_16) + vs_TEXCOORD0.xy;
    u_xlat2 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat5.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_0 = u_xlat2 * u_xlat16_0 + (-u_xlat2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.100000001<u_xlat16_4.y);
#else
    u_xlatb22 = 0.100000001<u_xlat16_4.y;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(vs_TEXCOORD0.w<0.75);
#else
    u_xlatb11 = vs_TEXCOORD0.w<0.75;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.25<vs_TEXCOORD0.w);
#else
    u_xlatb18 = 0.25<vs_TEXCOORD0.w;
#endif
    u_xlatb11 = u_xlatb18 && u_xlatb11;
    u_xlat6 = (u_xlatb11) ? 0.0 : 1.0;
    u_xlat16_3.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat5.x = u_xlat6;
    u_xlat16_10 = (u_xlatb22) ? u_xlat5.x : 0.0;
    u_xlat16_0 = vec4(u_xlat16_10) * u_xlat16_0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseSdf));
#else
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseSdf);
#endif
    u_xlat16_0 = (bool(u_xlatb22)) ? u_xlat16_0 : u_xlat2;
    u_xlat16_0.xyz = u_xlat16_4.xxx * _SpeColor.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xxx + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseEventAnimation));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseEventAnimation);
#endif
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _SDFTex_ST;
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec3 vs_VAR_TANGENT0;
mediump  vec4 phase0_Output0_2;
varying mediump float vs_VAR_LOCALZ0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec3 vs_NORMAL0;
varying mediump vec3 vs_VAR_FRAGMENT0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.w = u_xlat1.y;
    u_xlat16_3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat4.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-in_POSITION0.xyz);
    u_xlat2.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat2.x = dot(in_TANGENT0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    phase0_Output0_2 = u_xlat2;
    u_xlat16_3.x = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_8 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat15 = max(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.x = min(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat1.x = u_xlat15 * u_xlat15;
    u_xlat6 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat1.x * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat1.x * u_xlat6 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat15 * u_xlat1.x;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
    u_xlatb11 = abs(u_xlat16_8)<abs(u_xlat16_3.x);
    u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
    u_xlatb1 = u_xlat16_8<(-u_xlat16_8);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat1.x;
    u_xlat1.x = min(u_xlat16_8, u_xlat16_3.x);
    u_xlat6 = max(u_xlat16_8, u_xlat16_3.x);
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb1 = u_xlatb6 && u_xlatb1;
    u_xlat15 = (u_xlatb1) ? (-u_xlat15) : u_xlat15;
    u_xlat1.x = u_xlat15 * 0.318309873;
    u_xlatb15 = u_xlat15<0.0;
    vs_TEXCOORD2.xy = abs(u_xlat1.xx);
    u_xlat1.xy = in_TEXCOORD1.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_3.xy = (bool(u_xlatb15)) ? u_xlat1.xy : in_TEXCOORD1.xy;
    u_xlat1.xy = u_xlat16_3.xy * _SDFTex_ST.xy + _SDFTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_VAR_FRAGMENT0.xyz = u_xlat0.xyz;
vs_VAR_TANGENT0 = phase0_Output0_2.xyz;
vs_VAR_LOCALZ0 = phase0_Output0_2.w;
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
uniform 	mediump float _AnimationProcess;
uniform 	vec4 _AnimaScaleAndOffset;
uniform 	mediump vec3 _AnimaSpeCol;
uniform 	mediump float _UseEventAnimation;
uniform 	mediump float _ParallaxStrength;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump vec3 _LightAreaColor;
uniform 	mediump vec3 _DarkAreaColor;
uniform 	mediump float _UseSdf;
uniform lowp sampler2D _FunctionTex;
uniform lowp sampler2D _SDFTex;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec3 vs_VAR_TANGENT0;
varying mediump float vs_VAR_LOCALZ0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
ivec3 u_xlati1;
ivec3 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
int u_xlatu4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
int u_xlati8;
int u_xlatu8;
mediump float u_xlat16_10;
bool u_xlatb11;
mediump vec2 u_xlat16_14;
mediump float u_xlat16_16;
bool u_xlatb18;
int u_xlatu22;
bool u_xlatb22;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

int op_xor(int a, int b) { return (a + b - 2 * op_and(a, b)); }
ivec2 op_xor(ivec2 a, ivec2 b) { a.x = op_xor(a.x, b.x); a.y = op_xor(a.y, b.y); return a; }
ivec3 op_xor(ivec3 a, ivec3 b) { a.x = op_xor(a.x, b.x); a.y = op_xor(a.y, b.y); a.z = op_xor(a.z, b.z); return a; }
ivec4 op_xor(ivec4 a, ivec4 b) { a.x = op_xor(a.x, b.x); a.y = op_xor(a.y, b.y); a.z = op_xor(a.z, b.z); a.w = op_xor(a.w, b.w); return a; }

int op_shr(int a, int b) { return int(floor(float(a) / pow(2.0, float(b)))); }
ivec2 op_shr(ivec2 a, ivec2 b) { a.x = op_shr(a.x, b.x); a.y = op_shr(a.y, b.y); return a; }
ivec3 op_shr(ivec3 a, ivec3 b) { a.x = op_shr(a.x, b.x); a.y = op_shr(a.y, b.y); a.z = op_shr(a.z, b.z); return a; }
ivec4 op_shr(ivec4 a, ivec4 b) { a.x = op_shr(a.x, b.x); a.y = op_shr(a.y, b.y); a.z = op_shr(a.z, b.z); a.w = op_shr(a.w, b.w); return a; }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.5;
    u_xlat1.x = u_xlat16_0.y * _AnimaScaleAndOffset.y + _AnimaScaleAndOffset.w;
    u_xlat16_2.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * _AnimaScaleAndOffset.x + _AnimaScaleAndOffset.z;
    u_xlat16_2.y = fract(u_xlat1.x);
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Time.y * 50.0;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.100000001;
    u_xlat16_2.x = sin(u_xlat1.x);
    u_xlat16_3.x = cos(u_xlat1.x);
    u_xlat16_14.xy = u_xlat16_0.xy * u_xlat16_2.xx;
    u_xlat16_2.x = u_xlat16_0.y * u_xlat16_3.x + (-u_xlat16_14.x);
    u_xlat16_2.y = u_xlat16_0.x * u_xlat16_3.x + u_xlat16_14.y;
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.25, 0.25);
    u_xlat16_14.x = _AnimationProcess * 16.0;
    u_xlatu1.x = int(int(u_xlat16_14.x));
    u_xlatu1.y = int(op_xor(int(u_xlatu1.x), 4));
    u_xlatu1.z = int(max(float(u_xlatu1.x), (-float(u_xlatu1.x))));
    u_xlatu22 = int(op_shr(int(u_xlatu1.z), 2));
    u_xlati1.xyz = op_and(ivec3(u_xlatu1.xyz), ivec3(-2147483648, -2147483648, 3));
    u_xlatu4 = int(0 - int(u_xlatu22));
    u_xlatu8 = (u_xlati1.y != 0) ? int(u_xlatu4) : int(u_xlatu22);
    u_xlat4.y = float(int(u_xlatu8));
    u_xlati8 = 0 - u_xlati1.z;
    u_xlati1.x = (u_xlati1.x != 0) ? u_xlati8 : u_xlati1.z;
    u_xlat4.x = float(u_xlati1.x);
    u_xlat16_0.xy = u_xlat4.xy * vec2(0.25, 0.25) + u_xlat16_0.xy;
    u_xlat10_1 = texture2D(_FunctionTex, u_xlat16_0.xy).z;
    u_xlat1.xyz = vec3(u_xlat10_1) * _AnimaSpeCol.xyz;
    u_xlatb22 = 0.0<vs_VAR_LOCALZ0;
    u_xlat10_4.xyz = texture2D(_SDFTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_0.x = (-u_xlat10_4.y) + u_xlat10_4.z;
    u_xlat16_0.x = abs(vs_VAR_LOCALZ0) * u_xlat16_0.x + u_xlat10_4.y;
    u_xlat16_0.x = (u_xlatb22) ? u_xlat10_4.x : u_xlat16_0.x;
    u_xlat16_7.x = vs_TEXCOORD2.x + (-_ShadowFeather);
    u_xlat16_0.x = (-u_xlat16_7.x) + u_xlat16_0.x;
    u_xlat16_14.x = vs_TEXCOORD2.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_14.x;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_0.x = u_xlat16_7.x * u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_7.x;
    u_xlat16_7.xyz = _LightAreaColor.xyz + (-_DarkAreaColor.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + _DarkAreaColor.xyz;
    u_xlat16_2.x = dot(vs_VAR_TANGENT0.xyz, vs_VAR_TANGENT0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat16_2.xx * vs_VAR_TANGENT0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_ParallaxStrength);
    u_xlat10_4.xyz = texture2D(_FunctionTex, vs_TEXCOORD0.xy).xyw;
    u_xlat16_16 = (-u_xlat10_4.z) + 1.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_16) + vs_TEXCOORD0.xy;
    u_xlat2 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlat5.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_0 = u_xlat2 * u_xlat16_0 + (-u_xlat2);
    u_xlatb22 = 0.100000001<u_xlat10_4.y;
    u_xlatb11 = vs_TEXCOORD0.w<0.75;
    u_xlatb18 = 0.25<vs_TEXCOORD0.w;
    u_xlatb11 = u_xlatb18 && u_xlatb11;
    u_xlat6 = (u_xlatb11) ? 0.0 : 1.0;
    u_xlat16_3.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat5.x = u_xlat6;
    u_xlat16_10 = (u_xlatb22) ? u_xlat5.x : 0.0;
    u_xlat16_0 = vec4(u_xlat16_10) * u_xlat16_0 + u_xlat2;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseSdf);
    u_xlat16_0 = (bool(u_xlatb22)) ? u_xlat16_0 : u_xlat2;
    u_xlat16_0.xyz = u_xlat10_4.xxx * _SpeColor.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseEventAnimation);
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _SDFTex_ST;
uniform 	mediump vec3 _boneForward;
uniform 	mediump vec3 _boneRight;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec3 vs_VAR_TANGENT0;
mediump  vec4 phase0_Output0_2;
varying mediump float vs_VAR_LOCALZ0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
varying mediump vec3 vs_NORMAL0;
varying mediump vec3 vs_VAR_FRAGMENT0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
bool u_xlatb11;
float u_xlat15;
bool u_xlatb15;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat15 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * _WorldSpaceLightPos0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat2.w = u_xlat1.y;
    u_xlat16_3.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_3.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat4.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat4.xyz = u_xlat4.xyz + (-in_POSITION0.xyz);
    u_xlat2.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat2.x = dot(in_TANGENT0.xyz, u_xlat4.xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, u_xlat4.xyz);
    phase0_Output0_2 = u_xlat2;
    u_xlat16_3.x = dot(u_xlat1.xyz, _boneRight.xyz);
    u_xlat16_8 = dot(u_xlat1.xyz, _boneForward.xyz);
    u_xlat15 = max(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat1.x = min(abs(u_xlat16_8), abs(u_xlat16_3.x));
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat1.x = u_xlat15 * u_xlat15;
    u_xlat6 = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat6 = u_xlat1.x * u_xlat6 + 0.180141002;
    u_xlat6 = u_xlat1.x * u_xlat6 + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat6 + 0.999866009;
    u_xlat6 = u_xlat15 * u_xlat1.x;
    u_xlat6 = u_xlat6 * -2.0 + 1.57079637;
    u_xlatb11 = abs(u_xlat16_8)<abs(u_xlat16_3.x);
    u_xlat6 = u_xlatb11 ? u_xlat6 : float(0.0);
    u_xlat15 = u_xlat15 * u_xlat1.x + u_xlat6;
    u_xlatb1 = u_xlat16_8<(-u_xlat16_8);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat1.x;
    u_xlat1.x = min(u_xlat16_8, u_xlat16_3.x);
    u_xlat6 = max(u_xlat16_8, u_xlat16_3.x);
    u_xlatb6 = u_xlat6>=(-u_xlat6);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlatb1 = u_xlatb6 && u_xlatb1;
    u_xlat15 = (u_xlatb1) ? (-u_xlat15) : u_xlat15;
    u_xlat1.x = u_xlat15 * 0.318309873;
    u_xlatb15 = u_xlat15<0.0;
    vs_TEXCOORD2.xy = abs(u_xlat1.xx);
    u_xlat1.xy = in_TEXCOORD1.xy * vec2(-1.0, 1.0) + vec2(1.0, 0.0);
    u_xlat16_3.xy = (bool(u_xlatb15)) ? u_xlat1.xy : in_TEXCOORD1.xy;
    u_xlat1.xy = u_xlat16_3.xy * _SDFTex_ST.xy + _SDFTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_NORMAL0.xyz = u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_VAR_FRAGMENT0.xyz = u_xlat0.xyz;
vs_VAR_TANGENT0 = phase0_Output0_2.xyz;
vs_VAR_LOCALZ0 = phase0_Output0_2.w;
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
uniform 	mediump float _AnimationProcess;
uniform 	vec4 _AnimaScaleAndOffset;
uniform 	mediump vec3 _AnimaSpeCol;
uniform 	mediump float _UseEventAnimation;
uniform 	mediump float _ParallaxStrength;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump vec3 _LightAreaColor;
uniform 	mediump vec3 _DarkAreaColor;
uniform 	mediump float _UseSdf;
uniform lowp sampler2D _FunctionTex;
uniform lowp sampler2D _SDFTex;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec3 vs_VAR_TANGENT0;
varying mediump float vs_VAR_LOCALZ0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
ivec3 u_xlati1;
ivec3 u_xlatu1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
int u_xlatu4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_7;
int u_xlati8;
int u_xlatu8;
mediump float u_xlat16_10;
bool u_xlatb11;
mediump vec2 u_xlat16_14;
mediump float u_xlat16_16;
bool u_xlatb18;
int u_xlatu22;
bool u_xlatb22;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

int op_xor(int a, int b) { return (a + b - 2 * op_and(a, b)); }
ivec2 op_xor(ivec2 a, ivec2 b) { a.x = op_xor(a.x, b.x); a.y = op_xor(a.y, b.y); return a; }
ivec3 op_xor(ivec3 a, ivec3 b) { a.x = op_xor(a.x, b.x); a.y = op_xor(a.y, b.y); a.z = op_xor(a.z, b.z); return a; }
ivec4 op_xor(ivec4 a, ivec4 b) { a.x = op_xor(a.x, b.x); a.y = op_xor(a.y, b.y); a.z = op_xor(a.z, b.z); a.w = op_xor(a.w, b.w); return a; }

int op_shr(int a, int b) { return int(floor(float(a) / pow(2.0, float(b)))); }
ivec2 op_shr(ivec2 a, ivec2 b) { a.x = op_shr(a.x, b.x); a.y = op_shr(a.y, b.y); return a; }
ivec3 op_shr(ivec3 a, ivec3 b) { a.x = op_shr(a.x, b.x); a.y = op_shr(a.y, b.y); a.z = op_shr(a.z, b.z); return a; }
ivec4 op_shr(ivec4 a, ivec4 b) { a.x = op_shr(a.x, b.x); a.y = op_shr(a.y, b.y); a.z = op_shr(a.z, b.z); a.w = op_shr(a.w, b.w); return a; }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat16_0.x = u_xlat16_0.x * 2.0 + -0.5;
    u_xlat1.x = u_xlat16_0.y * _AnimaScaleAndOffset.y + _AnimaScaleAndOffset.w;
    u_xlat16_2.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * _AnimaScaleAndOffset.x + _AnimaScaleAndOffset.z;
    u_xlat16_2.y = fract(u_xlat1.x);
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat1.x = _Time.y * 50.0;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 0.100000001;
    u_xlat16_2.x = sin(u_xlat1.x);
    u_xlat16_3.x = cos(u_xlat1.x);
    u_xlat16_14.xy = u_xlat16_0.xy * u_xlat16_2.xx;
    u_xlat16_2.x = u_xlat16_0.y * u_xlat16_3.x + (-u_xlat16_14.x);
    u_xlat16_2.y = u_xlat16_0.x * u_xlat16_3.x + u_xlat16_14.y;
    u_xlat16_0.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(0.25, 0.25);
    u_xlat16_14.x = _AnimationProcess * 16.0;
    u_xlatu1.x = int(int(u_xlat16_14.x));
    u_xlatu1.y = int(op_xor(int(u_xlatu1.x), 4));
    u_xlatu1.z = int(max(float(u_xlatu1.x), (-float(u_xlatu1.x))));
    u_xlatu22 = int(op_shr(int(u_xlatu1.z), 2));
    u_xlati1.xyz = op_and(ivec3(u_xlatu1.xyz), ivec3(-2147483648, -2147483648, 3));
    u_xlatu4 = int(0 - int(u_xlatu22));
    u_xlatu8 = (u_xlati1.y != 0) ? int(u_xlatu4) : int(u_xlatu22);
    u_xlat4.y = float(int(u_xlatu8));
    u_xlati8 = 0 - u_xlati1.z;
    u_xlati1.x = (u_xlati1.x != 0) ? u_xlati8 : u_xlati1.z;
    u_xlat4.x = float(u_xlati1.x);
    u_xlat16_0.xy = u_xlat4.xy * vec2(0.25, 0.25) + u_xlat16_0.xy;
    u_xlat10_1 = texture2D(_FunctionTex, u_xlat16_0.xy).z;
    u_xlat1.xyz = vec3(u_xlat10_1) * _AnimaSpeCol.xyz;
    u_xlatb22 = 0.0<vs_VAR_LOCALZ0;
    u_xlat10_4.xyz = texture2D(_SDFTex, vs_TEXCOORD1.xy).xzw;
    u_xlat16_0.x = (-u_xlat10_4.y) + u_xlat10_4.z;
    u_xlat16_0.x = abs(vs_VAR_LOCALZ0) * u_xlat16_0.x + u_xlat10_4.y;
    u_xlat16_0.x = (u_xlatb22) ? u_xlat10_4.x : u_xlat16_0.x;
    u_xlat16_7.x = vs_TEXCOORD2.x + (-_ShadowFeather);
    u_xlat16_0.x = (-u_xlat16_7.x) + u_xlat16_0.x;
    u_xlat16_14.x = vs_TEXCOORD2.x + _ShadowFeather;
    u_xlat16_7.x = (-u_xlat16_7.x) + u_xlat16_14.x;
    u_xlat16_7.x = float(1.0) / u_xlat16_7.x;
    u_xlat16_0.x = u_xlat16_7.x * u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_7.x;
    u_xlat16_7.xyz = _LightAreaColor.xyz + (-_DarkAreaColor.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + _DarkAreaColor.xyz;
    u_xlat16_2.x = dot(vs_VAR_TANGENT0.xyz, vs_VAR_TANGENT0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat16_2.xx * vs_VAR_TANGENT0.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_ParallaxStrength);
    u_xlat10_4.xyz = texture2D(_FunctionTex, vs_TEXCOORD0.xy).xyw;
    u_xlat16_16 = (-u_xlat10_4.z) + 1.0;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(u_xlat16_16) + vs_TEXCOORD0.xy;
    u_xlat2 = texture2D(_MainTex, u_xlat16_2.xy);
    u_xlat5.xyz = u_xlat2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat5.xyz;
    u_xlat16_0.w = 1.0;
    u_xlat16_0 = u_xlat2 * u_xlat16_0 + (-u_xlat2);
    u_xlatb22 = 0.100000001<u_xlat10_4.y;
    u_xlatb11 = vs_TEXCOORD0.w<0.75;
    u_xlatb18 = 0.25<vs_TEXCOORD0.w;
    u_xlatb11 = u_xlatb18 && u_xlatb11;
    u_xlat6 = (u_xlatb11) ? 0.0 : 1.0;
    u_xlat16_3.x = (u_xlatb11) ? 1.0 : 0.0;
    u_xlat5.x = u_xlat6;
    u_xlat16_10 = (u_xlatb22) ? u_xlat5.x : 0.0;
    u_xlat16_0 = vec4(u_xlat16_10) * u_xlat16_0 + u_xlat2;
    u_xlatb22 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseSdf);
    u_xlat16_0 = (bool(u_xlatb22)) ? u_xlat16_0 : u_xlat2;
    u_xlat16_0.xyz = u_xlat10_4.xxx * _SpeColor.xyz + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat16_3.xyz = u_xlat1.xyz * u_xlat16_3.xxx + u_xlat16_0.xyz;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseEventAnimation);
    u_xlat16_0.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
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