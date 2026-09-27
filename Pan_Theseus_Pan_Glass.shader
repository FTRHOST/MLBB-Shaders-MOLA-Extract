//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Pan/Theseus_Pan_Glass" {
Properties {

[Header(Albedo)] _GlassTex ("玻璃基础色贴图", 2D) = "white" { }

_GlassColor ("玻璃基础色", Color) = (1,1,1,1)

[Header(Normal)] _NormalTex ("法线贴图", 2D) = "bump" { }

_NormalIntensity ("法线强度", Range(0, 2)) = 1.0

[Header(Reflect)] _MatCap ("MatCap反射贴图", 2D) = "white" { }

_GlassReflectColor ("反射颜色", Color) = (1,1,1,1)

_ReflectIntensity ("反射强度", Range(0, 1)) = 1.0

[Header(Refract)] _RefractTex ("MatCap折射贴图", 2D) = "white" { }

_RefractIntensity ("折射强度", Range(0, 3)) = 1.5

[Header(Other)] _Alpha ("整体透明强度", Range(0, 1)) = 1.0

[Space(10)] [Header(FlowLight)] [Toggle] _use_flow_light ("使用流光", Float) = 0.0

[Toggle] _UseFlowLight2U ("使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(RGB色)", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("X强度,YZ流速", Vector) = (1,0,0,0)

[Space(10)] [Header(Outline)] _FaceOutlineMask ("外描边遮罩", 2D) = "Black" { }

_Outline_Width ("外描边宽度", Float) = 0.019999999552965164

_Outline_Color ("外描边颜色", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("Outline_Offset_X 一般不用动", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y一般不用动", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 11185
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_3 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat16_3);
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
uniform 	mediump vec4 _GlassColor;
uniform 	mediump vec4 _GlassReflectColor;
uniform 	mediump float _ReflectIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _RefractIntensity;
uniform 	mediump float _Alpha;
uniform 	vec4 _FlowLightTex_ST;
uniform 	float _UseFlowLight2U;
uniform 	vec4 _FlowLightColor;
uniform 	vec4 _FlowLightFactory;
uniform 	float _use_flow_light;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _GlassTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat16;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xyz = texture(_GlassTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlassColor.xyz;
    u_xlat16_0.xyz = texture(_NormalTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_3.xyz = vec3(u_xlat16_25) * vs_TEXCOORD4.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD5.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * vs_TEXCOORD2.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz + u_xlat16_2.xyw;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat0 = u_xlat16_2.yyyy * hlslcc_mtx4x4unity_MatrixV[1].zxyz;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].zxyz * u_xlat16_2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].zxyz * u_xlat16_2.zzzz + u_xlat0;
    u_xlat3 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_MatrixV[1].yzzx;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].yzzx * vs_TEXCOORD0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].yzzx * vs_TEXCOORD0.zzzz + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_MatrixV[3].yzzx;
    u_xlat6.x = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3 = u_xlat3 * u_xlat6.xxxx;
    u_xlat16.xy = u_xlat0.zw * u_xlat3.zw;
    u_xlat0.xy = u_xlat3.yx * u_xlat0.yx + (-u_xlat16.yx);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_6.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_ReflectIntensity);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat7.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_25 = (-u_xlat16_25) + 1.0;
    u_xlat16_25 = u_xlat16_25 * _RefractIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy + vec2(u_xlat16_25);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _GlassColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat6.xyz * _GlassReflectColor.xyz + u_xlat16_1.xyz;
    u_xlat16_25 = max(u_xlat16_25, u_xlat6.x);
    SV_Target0.w = u_xlat16_25 * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light);
#endif
    if(u_xlatb0){
        u_xlat0.x = (-_UseFlowLight2U) + 1.0;
        u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
        u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
        u_xlat16.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
        u_xlat16.xy = u_xlat16.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_2 = texture(_FlowLightTex, u_xlat16.xy);
        u_xlat16_0.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
        u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
        u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
        SV_Target0.xyz = u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_3 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat16_3);
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
uniform 	mediump vec4 _GlassColor;
uniform 	mediump vec4 _GlassReflectColor;
uniform 	mediump float _ReflectIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _RefractIntensity;
uniform 	mediump float _Alpha;
uniform 	vec4 _FlowLightTex_ST;
uniform 	float _UseFlowLight2U;
uniform 	vec4 _FlowLightColor;
uniform 	vec4 _FlowLightFactory;
uniform 	float _use_flow_light;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _GlassTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat16;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xyz = texture(_GlassTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlassColor.xyz;
    u_xlat16_0.xyz = texture(_NormalTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_3.xyz = vec3(u_xlat16_25) * vs_TEXCOORD4.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD5.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * vs_TEXCOORD2.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz + u_xlat16_2.xyw;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat0 = u_xlat16_2.yyyy * hlslcc_mtx4x4unity_MatrixV[1].zxyz;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].zxyz * u_xlat16_2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].zxyz * u_xlat16_2.zzzz + u_xlat0;
    u_xlat3 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_MatrixV[1].yzzx;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].yzzx * vs_TEXCOORD0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].yzzx * vs_TEXCOORD0.zzzz + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_MatrixV[3].yzzx;
    u_xlat6.x = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3 = u_xlat3 * u_xlat6.xxxx;
    u_xlat16.xy = u_xlat0.zw * u_xlat3.zw;
    u_xlat0.xy = u_xlat3.yx * u_xlat0.yx + (-u_xlat16.yx);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_6.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_ReflectIntensity);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat7.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_25 = (-u_xlat16_25) + 1.0;
    u_xlat16_25 = u_xlat16_25 * _RefractIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy + vec2(u_xlat16_25);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _GlassColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat6.xyz * _GlassReflectColor.xyz + u_xlat16_1.xyz;
    u_xlat16_25 = max(u_xlat16_25, u_xlat6.x);
    SV_Target0.w = u_xlat16_25 * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light);
#endif
    if(u_xlatb0){
        u_xlat0.x = (-_UseFlowLight2U) + 1.0;
        u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
        u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
        u_xlat16.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
        u_xlat16.xy = u_xlat16.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_2 = texture(_FlowLightTex, u_xlat16.xy);
        u_xlat16_0.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
        u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
        u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
        SV_Target0.xyz = u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_3 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat16_3);
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
uniform 	mediump vec4 _GlassColor;
uniform 	mediump vec4 _GlassReflectColor;
uniform 	mediump float _ReflectIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _RefractIntensity;
uniform 	mediump float _Alpha;
uniform 	vec4 _FlowLightTex_ST;
uniform 	float _UseFlowLight2U;
uniform 	vec4 _FlowLightColor;
uniform 	vec4 _FlowLightFactory;
uniform 	float _use_flow_light;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _GlassTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat16;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xyz = texture(_GlassTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlassColor.xyz;
    u_xlat16_0.xyz = texture(_NormalTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_3.xyz = vec3(u_xlat16_25) * vs_TEXCOORD4.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD5.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * vs_TEXCOORD2.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz + u_xlat16_2.xyw;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat0 = u_xlat16_2.yyyy * hlslcc_mtx4x4unity_MatrixV[1].zxyz;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].zxyz * u_xlat16_2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].zxyz * u_xlat16_2.zzzz + u_xlat0;
    u_xlat3 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_MatrixV[1].yzzx;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].yzzx * vs_TEXCOORD0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].yzzx * vs_TEXCOORD0.zzzz + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_MatrixV[3].yzzx;
    u_xlat6.x = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3 = u_xlat3 * u_xlat6.xxxx;
    u_xlat16.xy = u_xlat0.zw * u_xlat3.zw;
    u_xlat0.xy = u_xlat3.yx * u_xlat0.yx + (-u_xlat16.yx);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_6.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_ReflectIntensity);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat7.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_25 = (-u_xlat16_25) + 1.0;
    u_xlat16_25 = u_xlat16_25 * _RefractIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy + vec2(u_xlat16_25);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _GlassColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat6.xyz * _GlassReflectColor.xyz + u_xlat16_1.xyz;
    u_xlat16_25 = max(u_xlat16_25, u_xlat6.x);
    SV_Target0.w = u_xlat16_25 * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light);
#endif
    if(u_xlatb0){
        u_xlat0.x = (-_UseFlowLight2U) + 1.0;
        u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
        u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
        u_xlat16.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
        u_xlat16.xy = u_xlat16.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_2 = texture(_FlowLightTex, u_xlat16.xy);
        u_xlat16_0.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
        u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
        u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
        SV_Target0.xyz = u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out highp vec3 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xyz = in_POSITION0.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_3 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD5.xyz = u_xlat0.xyz * vec3(u_xlat16_3);
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
uniform 	mediump vec4 _GlassColor;
uniform 	mediump vec4 _GlassReflectColor;
uniform 	mediump float _ReflectIntensity;
uniform 	mediump float _NormalIntensity;
uniform 	mediump float _RefractIntensity;
uniform 	mediump float _Alpha;
uniform 	vec4 _FlowLightTex_ST;
uniform 	float _UseFlowLight2U;
uniform 	vec4 _FlowLightColor;
uniform 	vec4 _FlowLightFactory;
uniform 	float _use_flow_light;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _GlassTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(2) uniform mediump sampler2D _MatCap;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowLightTex;
in highp vec3 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat16;
mediump float u_xlat16_25;
void main()
{
    u_xlat16_0.xyz = texture(_GlassTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _GlassColor.xyz;
    u_xlat16_0.xyz = texture(_NormalTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_NormalIntensity, _NormalIntensity));
    u_xlat16_25 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_3.xyz = vec3(u_xlat16_25) * vs_TEXCOORD4.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * vs_TEXCOORD5.xyz;
    u_xlat16_25 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_5.xyz = vec3(u_xlat16_25) * vs_TEXCOORD2.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_2.yyy;
    u_xlat16_2.xyw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz + u_xlat16_2.xyw;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz;
    u_xlat0 = u_xlat16_2.yyyy * hlslcc_mtx4x4unity_MatrixV[1].zxyz;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[0].zxyz * u_xlat16_2.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixV[2].zxyz * u_xlat16_2.zzzz + u_xlat0;
    u_xlat3 = vs_TEXCOORD0.yyyy * hlslcc_mtx4x4unity_MatrixV[1].yzzx;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[0].yzzx * vs_TEXCOORD0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixV[2].yzzx * vs_TEXCOORD0.zzzz + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_MatrixV[3].yzzx;
    u_xlat6.x = dot(u_xlat3.xzw, u_xlat3.xzw);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat3 = u_xlat3 * u_xlat6.xxxx;
    u_xlat16.xy = u_xlat0.zw * u_xlat3.zw;
    u_xlat0.xy = u_xlat3.yx * u_xlat0.yx + (-u_xlat16.yx);
    u_xlat0.xy = u_xlat0.xy * vec2(-0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_6.xyz = texture(_MatCap, u_xlat0.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_ReflectIntensity);
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_25 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_4.xyz = vec3(u_xlat16_25) * u_xlat7.xyz;
    u_xlat16_25 = dot(u_xlat16_2.xyz, u_xlat16_4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_25 = (-u_xlat16_25) + 1.0;
    u_xlat16_25 = u_xlat16_25 * _RefractIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat0.xy + vec2(u_xlat16_25);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _GlassColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_25) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat6.xyz * _GlassReflectColor.xyz + u_xlat16_1.xyz;
    u_xlat16_25 = max(u_xlat16_25, u_xlat6.x);
    SV_Target0.w = u_xlat16_25 * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_use_flow_light);
#endif
    if(u_xlatb0){
        u_xlat0.x = (-_UseFlowLight2U) + 1.0;
        u_xlat0.xy = u_xlat0.xx * vs_TEXCOORD3.xy;
        u_xlat0.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD3.zw + u_xlat0.xy;
        u_xlat16.xy = _Time.yy * _FlowLightFactory.yz + u_xlat0.xy;
        u_xlat16.xy = u_xlat16.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
        u_xlat16_2 = texture(_FlowLightTex, u_xlat16.xy);
        u_xlat16_0.xyz = texture(_FlowLightMask, u_xlat0.xy).xyz;
        u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightFactory.xxx;
        u_xlat0.xyz = u_xlat16_2.www * u_xlat0.xyz;
        u_xlat0.xyz = u_xlat0.xyz * _FlowLightColor.xyz + u_xlat16_1.xyz;
        SV_Target0.xyz = u_xlat0.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
}
}
 Pass {
 Name "Outline"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Front
  GpuProgramID 102392
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
uniform 	mediump float _Outline_Width;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(1) uniform mediump sampler2D _FaceOutlineMask;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_MatrixV[3].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
    u_xlat16_2.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_2.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.xyz = vec3(u_xlat12) * u_xlat16_2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat3.yyy;
    u_xlat16_2.xyz = in_TANGENT0.xyz * u_xlat3.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = in_NORMAL0.xyz * u_xlat3.zzz + u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
    u_xlat1.y = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Outline_Width, _Outline_Width, _Outline_Width));
    u_xlat12 = textureLod(_FaceOutlineMask, in_TEXCOORD0.xy, 0.0).w;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].z;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[1].z;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[2].z;
    u_xlat1.w = hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat0.w = 1.0;
    gl_Position.z = dot(u_xlat1, u_xlat0);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].x;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].x;
    gl_Position.x = dot(u_xlat1.xyz, u_xlat0.xzw);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].y;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].y;
    gl_Position.y = dot(u_xlat1.xyz, u_xlat0.yzw);
    u_xlat0.x = hlslcc_mtx4x4glstate_matrix_projection[2].w;
    u_xlat0.y = hlslcc_mtx4x4glstate_matrix_projection[3].w;
    gl_Position.w = dot(u_xlat0.xy, u_xlat0.zw);
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
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoMap;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = _Outline_Color.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = _Outline_Color.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Outline_Color.xyz;
    u_xlat16_1 = texture(_AlbedoMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * _Outline_Color.w;
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
uniform 	mediump float _Outline_Width;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(1) uniform mediump sampler2D _FaceOutlineMask;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_MatrixV[3].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat1.xyz;
    u_xlat16_2.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat16_2.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2.xyz = vec3(u_xlat12) * u_xlat16_2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat3.yyy;
    u_xlat16_2.xyz = in_TANGENT0.xyz * u_xlat3.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = in_NORMAL0.xyz * u_xlat3.zzz + u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat3.xyz;
    u_xlat1.y = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat3.xyz;
    u_xlat1.z = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Outline_Width, _Outline_Width, _Outline_Width));
    u_xlat12 = textureLod(_FaceOutlineMask, in_TEXCOORD0.xy, 0.0).w;
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].z;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[1].z;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[2].z;
    u_xlat1.w = hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat0.w = 1.0;
    gl_Position.z = dot(u_xlat1, u_xlat0);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[0].x;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].x;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].x;
    gl_Position.x = dot(u_xlat1.xyz, u_xlat0.xzw);
    u_xlat1.x = hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat1.y = hlslcc_mtx4x4glstate_matrix_projection[2].y;
    u_xlat1.z = hlslcc_mtx4x4glstate_matrix_projection[3].y;
    gl_Position.y = dot(u_xlat1.xyz, u_xlat0.yzw);
    u_xlat0.x = hlslcc_mtx4x4glstate_matrix_projection[2].w;
    u_xlat0.y = hlslcc_mtx4x4glstate_matrix_projection[3].w;
    gl_Position.w = dot(u_xlat0.xy, u_xlat0.zw);
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
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AlbedoMap;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = _Outline_Color.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_0.xyz = _Outline_Color.xyz * u_xlat16_0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Outline_Color.xyz;
    u_xlat16_1 = texture(_AlbedoMap, vs_TEXCOORD0.xy);
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w * _Outline_Color.w;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Pan_GlassGUI"
}