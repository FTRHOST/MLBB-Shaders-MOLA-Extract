//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/MeshEffect_StaticWater" {
Properties {

[ModuleBegin(1)] _ModuleBegin_RenderState ("渲染状态设置", Float) = 0.0

[ModuleEnd] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("剔除模式", Float) = 0.0

[ModuleBegin(0)] _ModuleBegin_Reflection ("反射贴图设置", Float) = 0.0

_ReflectionColor ("反射叠色", Color) = (1,1,1,1)

[ModuleEnd] _ReflectionIntensity ("反射强度", Range(0, 2)) = 1.0

[ModuleBegin(0)] _ModuleBegin_Ripple ("Ring Ripple 设置", Float) = 0.0

[Vector4Split(Range, Range, Range, Range)] _RippleParams1 ("涟漪参数1 ## 速度(0, 10) | 强度(0, 1) | 频率(0, 50) | 衰减半径(0, 20)", Vector) = (3,0.02,8,6)

[ModuleEnd] [Vector4Split(Range, Range, Enum, Hidden)] _RippleParams2 ("涟漪参数2 ## 扩散速度(0, 20) | 边缘软度(0.01, 4) | 水平面{XZ=0, XY=1, YZ=2} | _", Vector) = (4,1,0,0)

[ModuleBegin(_RIPPLE_NORMAL_LIT)] _ModuleBegin_NormalLit ("法线光照设置", Float) = 0.0

_LightDir ("光照方向", Vector) = (0.5,0.5,0,0)

_AmbientColor ("环境光颜色", Color) = (0.1,0.15,0.2,1)

_SpecColor2 ("高光颜色", Color) = (1,1,1,1)

[ModuleEnd] [Vector4Split(Range, Range, Range, Range)] _RippleLitParams ("光照参数 ## 法线推导缩放(0.001, 0.5) | 高光强度(0, 4) | 漫反射强度(0, 4) | 高光指数(1, 256)", Vector) = (0.3,1,1,32)

[ModuleBegin(_RIPPLE_VERTEX_DISP)] _ModuleBegin_VertexDisp ("顶点位移设置", Float) = 0.0

[ModuleEnd] [Vector4Split(Range, Float, Hidden, Hidden)] _VertexDispParams ("顶点位移参数 ## 位移缩放(0, 1) | 缩放单位 | _ | _", Vector) = (0.1,10,0,0)

}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 38562
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
uniform 	vec4 _RippleParams2;
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
void main()
{
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
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.yzw = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlati1 = int(_RippleParams2.z);
    u_xlatb1.xy = equal(ivec4(u_xlati1), ivec4(1, 2, 0, 0)).xy;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.y;
    vs_TEXCOORD1.xy = (u_xlatb1.x) ? u_xlat0.yz : u_xlat0.xw;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump float _ReflectionIntensity;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[4];
uniform 	float _RippleStartTimes[4];
uniform 	float _RippleDeactivatedTimes[4];
uniform 	int _RippleCount;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
vec2 u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat8;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
bool u_xlatb12;
int u_xlati15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = max(_RippleParams2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat10 = max(_RippleParams1.w, 0.00100000005);
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
    {
        u_xlat11 = _Time.y + (-_RippleStartTimes[u_xlati_loop_1]);
        u_xlat2.xy = vs_TEXCOORD1.xy + (-_RippleCenters[u_xlati_loop_1].xy);
        u_xlat16 = dot(u_xlat2.xy, u_xlat2.xy);
        u_xlat16 = sqrt(u_xlat16);
        u_xlat12 = u_xlat11 * u_xlat0.x + (-u_xlat16);
        u_xlat12 = u_xlat12 / u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
        u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(_RippleDeactivatedTimes[u_xlati_loop_1]>=0.0);
#else
        u_xlatb17 = _RippleDeactivatedTimes[u_xlati_loop_1]>=0.0;
#endif
        u_xlat3 = _Time.y + (-_RippleDeactivatedTimes[u_xlati_loop_1]);
        u_xlat3 = (-u_xlat3) * u_xlat0.x + u_xlat16;
        u_xlat3 = u_xlat3 / u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
        u_xlat17 = (u_xlatb17) ? u_xlat3 : 1.0;
        u_xlat3 = u_xlat16 / u_xlat10;
        u_xlat3 = (-u_xlat3) + 1.0;
        u_xlat3 = max(u_xlat3, 0.0);
        u_xlat8 = u_xlat16 + u_xlat16;
        u_xlat8 = min(u_xlat8, 1.0);
        u_xlat11 = u_xlat11 * _RippleParams1.x;
        u_xlat11 = u_xlat16 * _RippleParams1.z + (-u_xlat11);
        u_xlat11 = sin(u_xlat11);
        u_xlat11 = u_xlat3 * u_xlat11;
        u_xlat11 = u_xlat8 * u_xlat11;
        u_xlat11 = u_xlat12 * u_xlat11;
        u_xlat11 = u_xlat17 * u_xlat11;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(0.00100000005<u_xlat16);
#else
        u_xlatb12 = 0.00100000005<u_xlat16;
#endif
        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat16);
        u_xlat2.xy = bool(u_xlatb12) ? u_xlat2.xy : vec2(0.0, 0.0);
        u_xlat1.xy = u_xlat2.xy * vec2(u_xlat11) + u_xlat1.xy;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.xy = u_xlat1.xy * _RippleParams1.yy + u_xlat0.xy;
    u_xlat16_0 = texture(_ReflectionTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _ReflectionColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(_ReflectionIntensity);
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	vec4 _RippleParams2;
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
void main()
{
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
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.yzw = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlati1 = int(_RippleParams2.z);
    u_xlatb1.xy = equal(ivec4(u_xlati1), ivec4(1, 2, 0, 0)).xy;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.y;
    vs_TEXCOORD1.xy = (u_xlatb1.x) ? u_xlat0.yz : u_xlat0.xw;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump float _ReflectionIntensity;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[4];
uniform 	float _RippleStartTimes[4];
uniform 	float _RippleDeactivatedTimes[4];
uniform 	int _RippleCount;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
vec2 u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat8;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
bool u_xlatb12;
int u_xlati15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = max(_RippleParams2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat10 = max(_RippleParams1.w, 0.00100000005);
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
    {
        u_xlat11 = _Time.y + (-_RippleStartTimes[u_xlati_loop_1]);
        u_xlat2.xy = vs_TEXCOORD1.xy + (-_RippleCenters[u_xlati_loop_1].xy);
        u_xlat16 = dot(u_xlat2.xy, u_xlat2.xy);
        u_xlat16 = sqrt(u_xlat16);
        u_xlat12 = u_xlat11 * u_xlat0.x + (-u_xlat16);
        u_xlat12 = u_xlat12 / u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
        u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(_RippleDeactivatedTimes[u_xlati_loop_1]>=0.0);
#else
        u_xlatb17 = _RippleDeactivatedTimes[u_xlati_loop_1]>=0.0;
#endif
        u_xlat3 = _Time.y + (-_RippleDeactivatedTimes[u_xlati_loop_1]);
        u_xlat3 = (-u_xlat3) * u_xlat0.x + u_xlat16;
        u_xlat3 = u_xlat3 / u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
        u_xlat17 = (u_xlatb17) ? u_xlat3 : 1.0;
        u_xlat3 = u_xlat16 / u_xlat10;
        u_xlat3 = (-u_xlat3) + 1.0;
        u_xlat3 = max(u_xlat3, 0.0);
        u_xlat8 = u_xlat16 + u_xlat16;
        u_xlat8 = min(u_xlat8, 1.0);
        u_xlat11 = u_xlat11 * _RippleParams1.x;
        u_xlat11 = u_xlat16 * _RippleParams1.z + (-u_xlat11);
        u_xlat11 = sin(u_xlat11);
        u_xlat11 = u_xlat3 * u_xlat11;
        u_xlat11 = u_xlat8 * u_xlat11;
        u_xlat11 = u_xlat12 * u_xlat11;
        u_xlat11 = u_xlat17 * u_xlat11;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(0.00100000005<u_xlat16);
#else
        u_xlatb12 = 0.00100000005<u_xlat16;
#endif
        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat16);
        u_xlat2.xy = bool(u_xlatb12) ? u_xlat2.xy : vec2(0.0, 0.0);
        u_xlat1.xy = u_xlat2.xy * vec2(u_xlat11) + u_xlat1.xy;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.xy = u_xlat1.xy * _RippleParams1.yy + u_xlat0.xy;
    u_xlat16_0 = texture(_ReflectionTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * _ReflectionColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(_ReflectionIntensity);
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	vec4 _RippleParams2;
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
void main()
{
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
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.yzw = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlati1 = int(_RippleParams2.z);
    u_xlatb1.xy = equal(ivec4(u_xlati1), ivec4(1, 2, 0, 0)).xy;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.y;
    vs_TEXCOORD1.xy = (u_xlatb1.x) ? u_xlat0.yz : u_xlat0.xw;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump float _ReflectionIntensity;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[4];
uniform 	float _RippleStartTimes[4];
uniform 	float _RippleDeactivatedTimes[4];
uniform 	int _RippleCount;
uniform lowp sampler2D _ReflectionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec2 u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat8;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
bool u_xlatb12;
int u_xlati15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
#define UNITY_DYNAMIC_INDEX_ES2 0





float _RippleStartTimesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleStartTimes[i];
#else
#define d_ar _RippleStartTimes
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _RippleCentersDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleCenters[i];
#else
#define d_ar _RippleCenters
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


float _RippleDeactivatedTimesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleDeactivatedTimes[i];
#else
#define d_ar _RippleDeactivatedTimes
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat0.xy = max(_RippleParams2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat10 = max(_RippleParams1.w, 0.00100000005);
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
    {
        u_xlat11 = _Time.y + (-_RippleStartTimesDynamicIndex(u_xlati_loop_1));
        u_xlat2.xy = vs_TEXCOORD1.xy + (-_RippleCentersDynamicIndex(u_xlati_loop_1).xy);
        u_xlat16 = dot(u_xlat2.xy, u_xlat2.xy);
        u_xlat16 = sqrt(u_xlat16);
        u_xlat12 = u_xlat11 * u_xlat0.x + (-u_xlat16);
        u_xlat12 = u_xlat12 / u_xlat0.y;
        u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
        u_xlatb17 = _RippleDeactivatedTimesDynamicIndex(u_xlati_loop_1)>=0.0;
        u_xlat3 = _Time.y + (-_RippleDeactivatedTimesDynamicIndex(u_xlati_loop_1));
        u_xlat3 = (-u_xlat3) * u_xlat0.x + u_xlat16;
        u_xlat3 = u_xlat3 / u_xlat0.y;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat17 = (u_xlatb17) ? u_xlat3 : 1.0;
        u_xlat3 = u_xlat16 / u_xlat10;
        u_xlat3 = (-u_xlat3) + 1.0;
        u_xlat3 = max(u_xlat3, 0.0);
        u_xlat8 = u_xlat16 + u_xlat16;
        u_xlat8 = min(u_xlat8, 1.0);
        u_xlat11 = u_xlat11 * _RippleParams1.x;
        u_xlat11 = u_xlat16 * _RippleParams1.z + (-u_xlat11);
        u_xlat11 = sin(u_xlat11);
        u_xlat11 = u_xlat3 * u_xlat11;
        u_xlat11 = u_xlat8 * u_xlat11;
        u_xlat11 = u_xlat12 * u_xlat11;
        u_xlat11 = u_xlat17 * u_xlat11;
        u_xlatb12 = 0.00100000005<u_xlat16;
        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat16);
        u_xlat2.xy = bool(u_xlatb12) ? u_xlat2.xy : vec2(0.0, 0.0);
        u_xlat1.xy = u_xlat2.xy * vec2(u_xlat11) + u_xlat1.xy;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.xy = u_xlat1.xy * _RippleParams1.yy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_ReflectionTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _ReflectionColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(_ReflectionIntensity);
    SV_Target0.w = u_xlat10_0.w;
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
uniform 	vec4 _RippleParams2;
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati1;
bvec2 u_xlatb1;
void main()
{
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
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.yzw = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlati1 = int(_RippleParams2.z);
    u_xlatb1.xy = equal(ivec4(u_xlati1), ivec4(1, 2, 0, 0)).xy;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.y;
    vs_TEXCOORD1.xy = (u_xlatb1.x) ? u_xlat0.yz : u_xlat0.xw;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump float _ReflectionIntensity;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[4];
uniform 	float _RippleStartTimes[4];
uniform 	float _RippleDeactivatedTimes[4];
uniform 	int _RippleCount;
uniform lowp sampler2D _ReflectionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
vec2 u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat8;
float u_xlat10;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
bool u_xlatb12;
int u_xlati15;
float u_xlat16;
float u_xlat17;
bool u_xlatb17;
#define UNITY_DYNAMIC_INDEX_ES2 0





float _RippleStartTimesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleStartTimes[i];
#else
#define d_ar _RippleStartTimes
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _RippleCentersDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleCenters[i];
#else
#define d_ar _RippleCenters
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}


float _RippleDeactivatedTimesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleDeactivatedTimes[i];
#else
#define d_ar _RippleDeactivatedTimes
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat0.xy = max(_RippleParams2.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat10 = max(_RippleParams1.w, 0.00100000005);
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
    {
        u_xlat11 = _Time.y + (-_RippleStartTimesDynamicIndex(u_xlati_loop_1));
        u_xlat2.xy = vs_TEXCOORD1.xy + (-_RippleCentersDynamicIndex(u_xlati_loop_1).xy);
        u_xlat16 = dot(u_xlat2.xy, u_xlat2.xy);
        u_xlat16 = sqrt(u_xlat16);
        u_xlat12 = u_xlat11 * u_xlat0.x + (-u_xlat16);
        u_xlat12 = u_xlat12 / u_xlat0.y;
        u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
        u_xlatb17 = _RippleDeactivatedTimesDynamicIndex(u_xlati_loop_1)>=0.0;
        u_xlat3 = _Time.y + (-_RippleDeactivatedTimesDynamicIndex(u_xlati_loop_1));
        u_xlat3 = (-u_xlat3) * u_xlat0.x + u_xlat16;
        u_xlat3 = u_xlat3 / u_xlat0.y;
        u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
        u_xlat17 = (u_xlatb17) ? u_xlat3 : 1.0;
        u_xlat3 = u_xlat16 / u_xlat10;
        u_xlat3 = (-u_xlat3) + 1.0;
        u_xlat3 = max(u_xlat3, 0.0);
        u_xlat8 = u_xlat16 + u_xlat16;
        u_xlat8 = min(u_xlat8, 1.0);
        u_xlat11 = u_xlat11 * _RippleParams1.x;
        u_xlat11 = u_xlat16 * _RippleParams1.z + (-u_xlat11);
        u_xlat11 = sin(u_xlat11);
        u_xlat11 = u_xlat3 * u_xlat11;
        u_xlat11 = u_xlat8 * u_xlat11;
        u_xlat11 = u_xlat12 * u_xlat11;
        u_xlat11 = u_xlat17 * u_xlat11;
        u_xlatb12 = 0.00100000005<u_xlat16;
        u_xlat2.xy = u_xlat2.xy / vec2(u_xlat16);
        u_xlat2.xy = bool(u_xlatb12) ? u_xlat2.xy : vec2(0.0, 0.0);
        u_xlat1.xy = u_xlat2.xy * vec2(u_xlat11) + u_xlat1.xy;
    }
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.xy = u_xlat1.xy * _RippleParams1.yy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_ReflectionTex, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * _ReflectionColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * vec3(_ReflectionIntensity);
    SV_Target0.w = u_xlat10_0.w;
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
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}