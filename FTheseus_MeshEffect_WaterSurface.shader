//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FTheseus/MeshEffect/WaterSurface" {
Properties {

_AlbedoMap ("颜色", 2D) = "white" { }

_AlbedoColor ("AlbedoColor", Color) = (1,1,1,0.772549)

_DiffuseLerp ("基础颜色混合权重", Range(0, 1)) = 0.9829999804496765

_DiffuseLerp1 ("深色颜色混合权重", Range(0, 5)) = 2.0

_DiffuseLerp2 ("浅色颜色混合权重", Range(0, 1)) = 0.574999988079071

_NormalMap ("法线贴图", 2D) = "bump" { }

_NormalScaleA ("法线强度", Range(0, 1)) = 0.3529999852180481

_FresnelColor ("边缘光颜色", Color) = (1,0.5,0,1)

_FresnelMaskMap ("边缘光遮罩", 2D) = "white" { }

_FresnelPower ("边缘光范围", Range(0, 10)) = 5.0

_FresnelIntensity ("边缘光强度", Range(0, 5)) = 1.0

_EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_EmissiveBreathe ("emissiveBreathe", Vector) = (0,0,0,0)

_WaveNormalMap ("波浪法线", 2D) = "bump" { }

_WaveParamsB ("波浪法线参数", Vector) = (5,3,3,12)

_NormalScaleB ("波浪法线缩放", Range(0, 1)) = 0.6209999918937683

_Scale_Refraction ("透射缩放", Range(-0.5, 0.5)) = -0.020999999716877937

_RefractEnvColor ("折射环境颜色", Color) = (1,1,1,1)

_ScreenTexture ("折射贴图", 2D) = "white" { }

_EnvCapTex ("折射环境贴图", 2D) = "black" { }

_EnvColor ("折射环境颜色", Color) = (2,2,2,1)

[Toggle] _UseFlowLight2U ("使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(RGB色)", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_VAParams ("顶点扰动速度参数", Vector) = (5,3,3,12)

_VertexAnimMap ("扰动噪波图", 2D) = "black" { }

_VARange ("扰动范围", Range(0, 1)) = 0.6209999918937683

_VAScale ("扰动幅度", Range(0, 5)) = 1.0

_VAHeightScale ("扰动幅度缩放", Range(0, 1)) = 0.6439999938011169

_DissolveTex ("溶解贴图", 2D) = "black" { }

_DissolveTexUVR ("DissolveTexUVR", Vector) = (10,5,1,12)

_DissolveTexUVG ("DissolveTexUVG", Vector) = (1,1,0,8)

_DissolveLV ("DissolveLV", Vector) = (0.183,0.563,0.08,0)

_Dissolve ("溶解程度", Range(-1, 1)) = 0.0

_EdgeWidth ("溶解边缘宽度", Range(0, 1)) = 0.017000000923871994

_DissolveEdgeColor ("溶解边缘颜色1", Color) = (2.24235,3.83806,5.99216,1)

_DissolveEdgeColor2 ("溶解边缘颜色2", Color) = (0,0,0,1)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 8595
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
uniform 	mediump vec4 _VAParams;
uniform 	mediump float _VARange;
uniform 	mediump float _VAScale;
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
UNITY_LOCATION(5) uniform mediump sampler2D _VertexAnimMap;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _VAParams.zw * _Time.xx;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = in_TEXCOORD1.xy * _VAParams.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VertexAnimMap, u_xlat0.xy, 1.0).x;
    u_xlat3.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _VARange + u_xlat3.x;
    u_xlat0.x = u_xlat0.x * _VAScale;
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat2.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_COLOR0.www + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 1.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD3.w = in_COLOR0.x;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump float _NormalScaleA;
uniform 	mediump vec4 _WaveParamsB;
uniform 	mediump float _NormalScaleB;
uniform 	mediump float _DiffuseLerp;
uniform 	mediump float _DiffuseLerp1;
uniform 	mediump float _DiffuseLerp2;
uniform 	mediump vec4 _VAParams;
uniform 	mediump float _VARange;
uniform 	mediump float _VAHeightScale;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DissolveTexUVR;
uniform 	mediump vec4 _DissolveTexUVG;
uniform 	mediump vec4 _DissolveLV;
uniform 	mediump float _Dissolve;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump vec4 _DissolveEdgeColor2;
uniform 	mediump float _EdgeWidth;
uniform 	mediump float _Scale_Refraction;
uniform 	mediump vec4 _EnvCapTex_ST;
uniform 	mediump vec4 _RefractEnvColor;
uniform 	mediump vec4 _EnvColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _WaveNormalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(5) uniform mediump sampler2D _VertexAnimMap;
UNITY_LOCATION(6) uniform mediump sampler2D _ScreenTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _EnvCapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMaskMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_11;
vec2 u_xlat15;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
    u_xlat16_0.xy = vec2(_Dissolve) * _DissolveLV.ww + _DissolveTexUVG.zw;
    u_xlat1.xy = u_xlat16_0.xy * _Time.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1.xy = u_xlat15.xy * _DissolveTexUVG.xy + u_xlat1.xy;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat1.xy).z;
    u_xlat16_0.x = u_xlat16_1.x * _DissolveLV.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat1.xy = _DissolveTexUVR.zw * _Time.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat15.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = u_xlat15.xy * _DissolveTexUVR.xy + u_xlat1.xy;
    u_xlat15.xy = u_xlat15.xy * _ScreenParams.zw;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat16_8 = texture(_DissolveTex, vs_TEXCOORD0.zw).y;
    u_xlat16_7.x = u_xlat16_1.x * _DissolveLV.x + u_xlat16_8;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_7.x;
    u_xlat1.xy = _WaveParamsB.zw * _Time.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD0.zw * _WaveParamsB.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_WaveNormalMap, u_xlat1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat1.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_NormalScaleB) + vec3(0.0, 0.0, 1.0);
    u_xlat16_3.xyz = texture(_NormalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_NormalScaleA);
    u_xlat16_7.xyz = u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_7.xyz = u_xlat3.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_7.xyz = u_xlat3.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_7.xyz);
    u_xlat3.z = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_TEXCOORD2.www;
    u_xlat3.y = dot(u_xlat16_7.xyz, u_xlat2.xyz);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
    u_xlat16_7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat3.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 0.100000001);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    u_xlat16_11.x = log2(u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_11.x * _FresnelPower;
    u_xlat16_11.x = exp2(u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_11.x * _FresnelIntensity;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _FresnelColor.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * vs_TEXCOORD3.www;
    u_xlat1.x = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat8 = (-u_xlat16_4.x) + 1.0;
    u_xlat8 = u_xlat8 * 6.0;
    u_xlat8 = sin(u_xlat8);
    u_xlat16_0.x = _DissolveLV.z * u_xlat1.x + u_xlat16_0.x;
    u_xlat16_4.x = _DissolveLV.y + _DissolveLV.x;
    u_xlat16_4.x = u_xlat16_4.x + _DissolveLV.z;
    u_xlat16_4.x = u_xlat16_4.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x / u_xlat16_4.x;
    u_xlat16_4.x = _Dissolve + 0.100000001;
    u_xlat16_4.x = u_xlat16_0.x + (-u_xlat16_4.x);
    u_xlat16_0.x = u_xlat16_0.x + (-_Dissolve);
    u_xlat16_0.x = u_xlat16_0.x + (-_EdgeWidth);
    u_xlat16_0.x = (-u_xlat16_0.x) * 10.0 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_4.x<0.0);
#else
    u_xlatb1 = u_xlat16_4.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat3.xyz = u_xlat16_7.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xyz * u_xlat16_7.zzz + u_xlat3.xyz;
    u_xlat16_4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xy = u_xlat3.xy * u_xlat16_4.xx;
    u_xlat16_4.xy = (-u_xlat16_4.xy) * vec2(vec2(_Scale_Refraction, _Scale_Refraction));
    u_xlat3.xy = u_xlat16_4.xy * vec2(1.0, -1.0);
    u_xlat1.xy = vec2(u_xlat8) * u_xlat3.xy + u_xlat15.xy;
    u_xlat16_1.xyz = textureLod(_ScreenTexture, u_xlat1.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1 = texture(_AlbedoMap, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz;
    u_xlat1.xyz = _RefractEnvColor.xyz * u_xlat16_4.xyz + (-u_xlat16_6.xyz);
    u_xlat3.xy = _VAParams.zw * _Time.xx;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = vs_TEXCOORD0.zw * _VAParams.xy + u_xlat3.xy;
    u_xlat16_23 = texture(_VertexAnimMap, u_xlat3.xy).x;
    u_xlat16_4.x = u_xlat16_23 * 2.0 + -1.0;
    u_xlat16_11.x = u_xlat16_23 + (-u_xlat16_4.x);
    u_xlat16_4.x = u_xlat16_11.x * _VARange + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _VAHeightScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x + (-_DiffuseLerp1);
    u_xlat16_11.x = (-_DiffuseLerp1) + _DiffuseLerp2;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = (-u_xlat16_4.x) * 2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_11.x;
    u_xlat16_4.x = u_xlat16_4.x * _DiffuseLerp;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz + (-u_xlat1.xyz);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_4.xyz + u_xlat1.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_5.x = dot(u_xlat1.xyz, u_xlat16_7.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_5.y = dot(u_xlat1.xyz, u_xlat16_7.xyz);
    u_xlat1.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * vs_TEXCOORD3.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * vs_TEXCOORD3.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_MatrixV[3].xy;
    u_xlat16_7.xy = u_xlat1.xy * u_xlat16_5.xy;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * _EnvCapTex_ST.xy + _EnvCapTex_ST.zw;
    u_xlat16_1.xyz = texture(_EnvCapTex, u_xlat16_7.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _EnvColor.xyz + u_xlat16_4.xyz;
    u_xlat1.x = _EmissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat8 = (-_EmissiveBreathe.z) + 1.0;
    u_xlat1.x = u_xlat8 * abs(u_xlat1.x);
    u_xlat16_3 = texture(_EmissiveMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_3.w>=0.5);
#else
    u_xlatb8 = u_xlat16_3.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissiveColor.xyz;
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat1.x = u_xlat1.x + _EmissiveBreathe.z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat1.xyz + u_xlat16_7.xyz;
    u_xlat16_4.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.www;
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = _DissolveEdgeColor2.xyz * _DissolveEdgeColor2.www + u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = texture(_FresnelMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat2.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    u_xlat16_21 = (-_UseFlowLight2U) + 1.0;
    u_xlat16_4.xy = vec2(u_xlat16_21) * vs_TEXCOORD0.xy;
    u_xlat16_4.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD0.zw + u_xlat16_4.xy;
    u_xlat16_1.xyz = texture(_FlowLightMask, u_xlat16_4.xy).xyz;
    u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_2 = texture(_FlowLightTex, u_xlat16_4.xy);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowLightFactory.xxx;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * _FlowLightColor.xyz + u_xlat16_0.xyz;
    u_xlat1.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _VAParams;
uniform 	mediump float _VARange;
uniform 	mediump float _VAScale;
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
UNITY_LOCATION(5) uniform mediump sampler2D _VertexAnimMap;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _VAParams.zw * _Time.xx;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = in_TEXCOORD1.xy * _VAParams.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VertexAnimMap, u_xlat0.xy, 1.0).x;
    u_xlat3.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _VARange + u_xlat3.x;
    u_xlat0.x = u_xlat0.x * _VAScale;
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat3.x = max(u_xlat3.x, 1.17549435e-38);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat2.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_COLOR0.www + u_xlat2.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 1.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = in_TANGENT0.w;
    vs_TEXCOORD3.w = in_COLOR0.x;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _EmissiveBreathe;
uniform 	mediump float _NormalScaleA;
uniform 	mediump vec4 _WaveParamsB;
uniform 	mediump float _NormalScaleB;
uniform 	mediump float _DiffuseLerp;
uniform 	mediump float _DiffuseLerp1;
uniform 	mediump float _DiffuseLerp2;
uniform 	mediump vec4 _VAParams;
uniform 	mediump float _VARange;
uniform 	mediump float _VAHeightScale;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DissolveTexUVR;
uniform 	mediump vec4 _DissolveTexUVG;
uniform 	mediump vec4 _DissolveLV;
uniform 	mediump float _Dissolve;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump vec4 _DissolveEdgeColor2;
uniform 	mediump float _EdgeWidth;
uniform 	mediump float _Scale_Refraction;
uniform 	mediump vec4 _EnvCapTex_ST;
uniform 	mediump vec4 _RefractEnvColor;
uniform 	mediump vec4 _EnvColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
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
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _WaveNormalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(5) uniform mediump sampler2D _VertexAnimMap;
UNITY_LOCATION(6) uniform mediump sampler2D _ScreenTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _EnvCapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _FresnelMaskMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
mediump vec3 u_xlat16_11;
vec2 u_xlat15;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
    u_xlat16_0.xy = vec2(_Dissolve) * _DissolveLV.ww + _DissolveTexUVG.zw;
    u_xlat1.xy = u_xlat16_0.xy * _Time.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat15.xy = vs_TEXCOORD0.zw * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat1.xy = u_xlat15.xy * _DissolveTexUVG.xy + u_xlat1.xy;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat1.xy).z;
    u_xlat16_0.x = u_xlat16_1.x * _DissolveLV.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat1.xy = _DissolveTexUVR.zw * _Time.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat15.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = u_xlat15.xy * _DissolveTexUVR.xy + u_xlat1.xy;
    u_xlat15.xy = u_xlat15.xy * _ScreenParams.zw;
    u_xlat16_1.x = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat16_8 = texture(_DissolveTex, vs_TEXCOORD0.zw).y;
    u_xlat16_7.x = u_xlat16_1.x * _DissolveLV.x + u_xlat16_8;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_7.x;
    u_xlat1.xy = _WaveParamsB.zw * _Time.xx;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = vs_TEXCOORD0.zw * _WaveParamsB.xy + u_xlat1.xy;
    u_xlat16_2.xyz = texture(_WaveNormalMap, u_xlat1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat1.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_NormalScaleB) + vec3(0.0, 0.0, 1.0);
    u_xlat16_3.xyz = texture(_NormalMap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(_NormalScaleA);
    u_xlat16_7.xyz = u_xlat2.xyz + u_xlat16_7.xyz;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat16_7.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat1.xxx * vs_TEXCOORD1.xyz;
    u_xlat16_7.xyz = u_xlat3.zxy * vs_TEXCOORD2.yzx;
    u_xlat16_7.xyz = u_xlat3.yzx * vs_TEXCOORD2.zxy + (-u_xlat16_7.xyz);
    u_xlat3.z = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_TEXCOORD2.www;
    u_xlat3.y = dot(u_xlat16_7.xyz, u_xlat2.xyz);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, u_xlat2.xyz);
    u_xlat16_7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat3.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat16_4.x = dot(u_xlat16_7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(vs_TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat16_11.x = max(u_xlat16_11.x, 0.100000001);
    u_xlat16_11.x = (-u_xlat16_11.x) + 1.0;
    u_xlat16_11.x = log2(u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_11.x * _FresnelPower;
    u_xlat16_11.x = exp2(u_xlat16_11.x);
    u_xlat16_11.x = u_xlat16_11.x * _FresnelIntensity;
    u_xlat16_11.xyz = u_xlat16_11.xxx * _FresnelColor.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * vs_TEXCOORD3.www;
    u_xlat1.x = u_xlat16_4.x * 0.5 + 0.5;
    u_xlat8 = (-u_xlat16_4.x) + 1.0;
    u_xlat8 = u_xlat8 * 6.0;
    u_xlat8 = sin(u_xlat8);
    u_xlat16_0.x = _DissolveLV.z * u_xlat1.x + u_xlat16_0.x;
    u_xlat16_4.x = _DissolveLV.y + _DissolveLV.x;
    u_xlat16_4.x = u_xlat16_4.x + _DissolveLV.z;
    u_xlat16_4.x = u_xlat16_4.x + 1.0;
    u_xlat16_0.x = u_xlat16_0.x / u_xlat16_4.x;
    u_xlat16_4.x = _Dissolve + 0.100000001;
    u_xlat16_4.x = u_xlat16_0.x + (-u_xlat16_4.x);
    u_xlat16_0.x = u_xlat16_0.x + (-_Dissolve);
    u_xlat16_0.x = u_xlat16_0.x + (-_EdgeWidth);
    u_xlat16_0.x = (-u_xlat16_0.x) * 10.0 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_4.x<0.0);
#else
    u_xlatb1 = u_xlat16_4.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat3.xyz = u_xlat16_7.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xyz * u_xlat16_7.zzz + u_xlat3.xyz;
    u_xlat16_4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
    u_xlat16_4.xy = u_xlat3.xy * u_xlat16_4.xx;
    u_xlat16_4.xy = (-u_xlat16_4.xy) * vec2(vec2(_Scale_Refraction, _Scale_Refraction));
    u_xlat3.xy = u_xlat16_4.xy * vec2(1.0, -1.0);
    u_xlat1.xy = vec2(u_xlat8) * u_xlat3.xy + u_xlat15.xy;
    u_xlat16_1.xyz = textureLod(_ScreenTexture, u_xlat1.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1 = texture(_AlbedoMap, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz;
    u_xlat1.xyz = _RefractEnvColor.xyz * u_xlat16_4.xyz + (-u_xlat16_6.xyz);
    u_xlat3.xy = _VAParams.zw * _Time.xx;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat3.xy = vs_TEXCOORD0.zw * _VAParams.xy + u_xlat3.xy;
    u_xlat16_23 = texture(_VertexAnimMap, u_xlat3.xy).x;
    u_xlat16_4.x = u_xlat16_23 * 2.0 + -1.0;
    u_xlat16_11.x = u_xlat16_23 + (-u_xlat16_4.x);
    u_xlat16_4.x = u_xlat16_11.x * _VARange + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _VAHeightScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x + (-_DiffuseLerp1);
    u_xlat16_11.x = (-_DiffuseLerp1) + _DiffuseLerp2;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = (-u_xlat16_4.x) * 2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_11.x;
    u_xlat16_4.x = u_xlat16_4.x * _DiffuseLerp;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _AlbedoColor.xyz + (-u_xlat1.xyz);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_4.xyz + u_xlat1.xyz;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_5.x = dot(u_xlat1.xyz, u_xlat16_7.xyz);
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_5.y = dot(u_xlat1.xyz, u_xlat16_7.xyz);
    u_xlat1.xy = vs_TEXCOORD3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * vs_TEXCOORD3.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * vs_TEXCOORD3.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_MatrixV[3].xy;
    u_xlat16_7.xy = u_xlat1.xy * u_xlat16_5.xy;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * _EnvCapTex_ST.xy + _EnvCapTex_ST.zw;
    u_xlat16_1.xyz = texture(_EnvCapTex, u_xlat16_7.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _EnvColor.xyz + u_xlat16_4.xyz;
    u_xlat1.x = _EmissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat8 = (-_EmissiveBreathe.z) + 1.0;
    u_xlat1.x = u_xlat8 * abs(u_xlat1.x);
    u_xlat16_3 = texture(_EmissiveMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_3.w>=0.5);
#else
    u_xlatb8 = u_xlat16_3.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissiveColor.xyz;
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat1.x = u_xlat1.x + _EmissiveBreathe.z;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat1.xyz + u_xlat16_7.xyz;
    u_xlat16_4.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.www;
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = _DissolveEdgeColor2.xyz * _DissolveEdgeColor2.www + u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_7.xyz + u_xlat16_4.xyz;
    u_xlat16_1.x = texture(_FresnelMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat2.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    u_xlat16_21 = (-_UseFlowLight2U) + 1.0;
    u_xlat16_4.xy = vec2(u_xlat16_21) * vs_TEXCOORD0.xy;
    u_xlat16_4.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD0.zw + u_xlat16_4.xy;
    u_xlat16_1.xyz = texture(_FlowLightMask, u_xlat16_4.xy).xyz;
    u_xlat2.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat2.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat16_2 = texture(_FlowLightTex, u_xlat16_4.xy);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowLightFactory.xxx;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * _FlowLightColor.xyz + u_xlat16_0.xyz;
    u_xlat1.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
CustomEditor "FTheseusShaderGUI.MeshEffectWaterSurfaceShaderGUI"
}