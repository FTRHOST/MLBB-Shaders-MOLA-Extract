//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/SimplePBR(VertexAnim)_ScreenDistort" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_zwrite ("深度写入", Float) = 1.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_metallic ("金属度", Range(0, 1)) = 0.0

_normalMap ("法线贴图", 2D) = "bump" { }

_emissiveMap ("自发光贴图", 2D) = "black" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_emissiveBreathe ("自发光呼吸参数", Vector) = (0,0,0,0)

_flowMap ("流动贴图(RG=方向)", 2D) = "gray" { }

_flowIntensity ("扭曲强度", Range(-1, 1)) = 0.10000000149011612

_flowSpeed ("流动速度", Range(-20, 20)) = 1.0

_USE_DOUBLE_FLOWLIGHT ("双层流光开关", Float) = 0.0

[Toggle] _UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(R通道)", 2D) = "white" { }

_FlowLightUpTex ("流光上层纹理", 2D) = "black" { }

_FlowLightUpColor ("流光上层颜色", Color) = (1,1,1,1)

_FlowLightDownTex ("流光下层纹理", 2D) = "black" { }

_FlowLightDownColor ("流光下层颜色", Color) = (1,1,1,1)

_FlowLightDownDepth ("流光下层深度", Range(0, 1)) = 0.0

_FlowLightUpFactory ("流光上层参数", Vector) = (1,1,1,0)

_FlowLightDownFactory ("流光下层参数", Vector) = (1,-1,1,0)

_FresnelMask ("R:菲涅尔遮罩", 2D) = "white" { }

_FresnelColor ("菲涅尔颜色", Color) = (1,1,1,1)

_FresnelVector ("菲涅尔参数", Vector) = (1,0,0,0)

_ao ("AO强度", Range(0, 1)) = 1.0

_ScreenDistortNoiseMap ("扰动噪声图(RG通道)", 2D) = "gray" { }

_ScreenDistortExtrude ("顶点法线挤出距离", Float) = 0.0

_ScreenDistortParams ("屏幕扰动参数", Vector) = (0,0,1,0.05)

_ScreenDistortFresnelParams ("屏幕扰动菲涅尔遮罩", Vector) = (0.5,0.3,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "SimpleLit"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 35007
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.zxy;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.zxy;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.zxy;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.zxy;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.xyz;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.xyz;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.xyz;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.xyz;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.zxy;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.zxy;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.zxy;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.zxy;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat1.x = u_xlat24 * 0.0625 + u_xlat1.y;
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_8.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_8.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.xyz;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.xyz;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _ao;
uniform 	mediump float _metallic;
uniform 	mediump vec4 _albedoMap_ST;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _FresnelVector;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FresnelMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_19;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat16_1 = texture(_albedoMap, u_xlat16_1.xy);
    u_xlat16_2.x = u_xlat16_1.w * _albedoColor.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb8 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb8;
    if(u_xlatb0){discard;}
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_26;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _albedoColor.xyz;
    u_xlat16_26 = (-_metallic) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_26 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_26) + vs_TEXCOORD2.yzx;
    u_xlat24 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat5.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat4.y = u_xlat5.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat5.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat16_26 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = vec3(u_xlat16_26) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_ao, _ao, _ao));
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_26 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_19 = u_xlat16_26 * u_xlat4.z;
    u_xlat3.xy = u_xlat4.xy * vec2(u_xlat16_26) + _FresnelVector.zw;
    u_xlat3.z = u_xlat16_19;
    u_xlat24 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat0.x) + 1.0;
    u_xlat16_26 = log2(u_xlat16_26);
    u_xlat16_7.x = max(_FresnelVector.x, 0.00999999978);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_7.x;
    u_xlat16_26 = exp2(u_xlat16_26);
    u_xlat16_26 = u_xlat16_26 * _FresnelVector.y;
    u_xlat16_7.xyz = vec3(u_xlat16_26) * _FresnelColor.xyz;
    u_xlat16_0 = texture(_FresnelMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat0.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat0.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
}
}
 GrabPass {
}
 Pass {
 Name "ScreenDistortion"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 120417
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _ScreenDistortNoiseMap_ST;
uniform 	mediump float _ScreenDistortExtrude;
uniform 	mediump vec4 _ScreenDistortParams;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_ScreenDistortExtrude) + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat16_2.xy = in_TEXCOORD0.xy * _ScreenDistortNoiseMap_ST.xy + _ScreenDistortNoiseMap_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * _ScreenDistortParams.zz;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = in_COLOR0.x;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _ScreenDistortParams;
uniform 	mediump vec4 _ScreenDistortFresnelParams;
uniform lowp sampler2D _ScreenDistortNoiseMap;
uniform lowp sampler2D _GrabTexture;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_10 = inversesqrt(u_xlat16_10);
    u_xlat16_2.xyz = vec3(u_xlat16_10) * vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat0.x = u_xlat16_1.x + (-_ScreenDistortFresnelParams.x);
    u_xlat3 = max(_ScreenDistortFresnelParams.y, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * -2.0 + 1.0;
    u_xlatb0 = _ScreenDistortFresnelParams.z>=0.5;
    u_xlat16_4.x = (u_xlatb0) ? u_xlat16_4.x : 0.0;
    u_xlat16_1.x = u_xlat16_4.x + u_xlat16_1.x;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.xy = u_xlat0.xx * _ScreenDistortParams.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xy = texture2D(_ScreenDistortNoiseMap, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat0.xy * _ScreenDistortParams.ww;
    u_xlat16_1.xy = u_xlat16_1.xx * u_xlat16_4.xy;
    u_xlat16_7 = vs_TEXCOORD3.w;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat16_1.xy * vec2(u_xlat16_7) + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _ScreenDistortNoiseMap_ST;
uniform 	mediump float _ScreenDistortExtrude;
uniform 	mediump vec4 _ScreenDistortParams;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_ScreenDistortExtrude) + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat16_2.xy = in_TEXCOORD0.xy * _ScreenDistortNoiseMap_ST.xy + _ScreenDistortNoiseMap_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * _ScreenDistortParams.zz;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = in_COLOR0.x;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _ScreenDistortParams;
uniform 	mediump vec4 _ScreenDistortFresnelParams;
uniform lowp sampler2D _ScreenDistortNoiseMap;
uniform lowp sampler2D _GrabTexture;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_10 = inversesqrt(u_xlat16_10);
    u_xlat16_2.xyz = vec3(u_xlat16_10) * vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat0.x = u_xlat16_1.x + (-_ScreenDistortFresnelParams.x);
    u_xlat3 = max(_ScreenDistortFresnelParams.y, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * -2.0 + 1.0;
    u_xlatb0 = _ScreenDistortFresnelParams.z>=0.5;
    u_xlat16_4.x = (u_xlatb0) ? u_xlat16_4.x : 0.0;
    u_xlat16_1.x = u_xlat16_4.x + u_xlat16_1.x;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.xy = u_xlat0.xx * _ScreenDistortParams.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0.xy = texture2D(_ScreenDistortNoiseMap, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat0.xy * _ScreenDistortParams.ww;
    u_xlat16_1.xy = u_xlat16_1.xx * u_xlat16_4.xy;
    u_xlat16_7 = vs_TEXCOORD3.w;
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat16_1.xy * vec2(u_xlat16_7) + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
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
uniform 	mediump vec4 _ScreenDistortNoiseMap_ST;
uniform 	mediump float _ScreenDistortExtrude;
uniform 	mediump vec4 _ScreenDistortParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_ScreenDistortExtrude) + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat16_2.xy = in_TEXCOORD0.xy * _ScreenDistortNoiseMap_ST.xy + _ScreenDistortNoiseMap_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * _ScreenDistortParams.zz;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = in_COLOR0.x;
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
uniform 	mediump vec4 _ScreenDistortParams;
uniform 	mediump vec4 _ScreenDistortFresnelParams;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ScreenDistortNoiseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_10 = inversesqrt(u_xlat16_10);
    u_xlat16_2.xyz = vec3(u_xlat16_10) * vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat16_1.x + (-_ScreenDistortFresnelParams.x);
    u_xlat3 = max(_ScreenDistortFresnelParams.y, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * -2.0 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ScreenDistortFresnelParams.z>=0.5);
#else
    u_xlatb0 = _ScreenDistortFresnelParams.z>=0.5;
#endif
    u_xlat16_4.x = (u_xlatb0) ? u_xlat16_4.x : 0.0;
    u_xlat16_1.x = u_xlat16_4.x + u_xlat16_1.x;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.xy = u_xlat0.xx * _ScreenDistortParams.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_ScreenDistortNoiseMap, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat0.xy * _ScreenDistortParams.ww;
    u_xlat16_1.xy = u_xlat16_1.xx * u_xlat16_4.xy;
    u_xlat16_7 = vs_TEXCOORD3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat16_1.xy * vec2(u_xlat16_7) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
uniform 	mediump vec4 _ScreenDistortNoiseMap_ST;
uniform 	mediump float _ScreenDistortExtrude;
uniform 	mediump vec4 _ScreenDistortParams;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_ScreenDistortExtrude) + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat16_2.xy = in_TEXCOORD0.xy * _ScreenDistortNoiseMap_ST.xy + _ScreenDistortNoiseMap_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * _ScreenDistortParams.zz;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD3.w = in_COLOR0.x;
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
uniform 	mediump vec4 _ScreenDistortParams;
uniform 	mediump vec4 _ScreenDistortFresnelParams;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ScreenDistortNoiseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_10 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat16_10 = inversesqrt(u_xlat16_10);
    u_xlat16_2.xyz = vec3(u_xlat16_10) * vs_TEXCOORD3.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat16_1.x + (-_ScreenDistortFresnelParams.x);
    u_xlat3 = max(_ScreenDistortFresnelParams.y, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * -2.0 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ScreenDistortFresnelParams.z>=0.5);
#else
    u_xlatb0 = _ScreenDistortFresnelParams.z>=0.5;
#endif
    u_xlat16_4.x = (u_xlatb0) ? u_xlat16_4.x : 0.0;
    u_xlat16_1.x = u_xlat16_4.x + u_xlat16_1.x;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.xy = u_xlat0.xx * _ScreenDistortParams.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat16_0.xy = texture(_ScreenDistortNoiseMap, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat0.xy * _ScreenDistortParams.ww;
    u_xlat16_1.xy = u_xlat16_1.xx * u_xlat16_4.xy;
    u_xlat16_7 = vs_TEXCOORD3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7 = min(max(u_xlat16_7, 0.0), 1.0);
#else
    u_xlat16_7 = clamp(u_xlat16_7, 0.0, 1.0);
#endif
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat16_1.xy * vec2(u_xlat16_7) + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
CustomEditor "CodeGenShaderGUI.Theseus_SimplePbr_VetexAnim_ScreenDistortGUI"
}