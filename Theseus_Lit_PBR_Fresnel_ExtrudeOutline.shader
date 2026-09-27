//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_Fresnel_ExtrudeOutline" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

_normalMap ("法线贴图", 2D) = "bump" { }

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Toggle] _EMISSIVE_BREATHE ("自发光呼吸开关", Float) = 0.0

_emissiveBreathe ("自发光呼吸", Vector) = (0,0,0,0)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_Dissolve_Tex ("溶解纹理", 2D) = "black" { }

_Dissovle_Tiling_Offset ("溶解纹理_Tiling_Offset", Vector) = (1,1,0,0)

[Toggle] _Dissovle_Directional ("根据UV定向溶解", Float) = 1.0

[Toggle] _Dissovle_Use_2U ("溶解使用2U", Float) = 1.0

_DissolveColor ("拖尾颜色", Color) = (1,1,1,1)

_DissovleEdgeShrinkage ("边缘压缩", Float) = 4.0

_DissovleTarilShrinkage ("拖尾范围", Float) = 1.0

_DissovleTarilPower ("拖尾强度", Float) = 1.0

_ClipAmount ("溶解进度", Range(-2, 1)) = 1.0

_Dis_Width ("溶解边缘范围", Range(0, 1)) = 0.0

_UseFlowLight2U ("使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(RGB色)", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_LaserMask ("R:镭射遮罩 G:Ramp索引", 2D) = "white" { }

_LaserRamp ("镭射Ramp", 2D) = "black" { }

_LaserColor ("镭射颜色", Color) = (1,1,1,1)

_LaserRampIntensity ("镭射强度", Float) = 1.0

_FresnelTex ("R:手绘菲涅尔 G:菲涅尔遮罩", 2D) = "black" { }

_FresnelColor ("手绘菲涅尔颜色", Color) = (1,1,1,1)

_FresnelDir ("菲涅尔方向偏移", Vector) = (0,0,0,0)

_Fresnel2Color ("菲涅尔2颜色", Color) = (1,1,1,1)

_Fresnel3Color ("菲涅尔3颜色", Color) = (1,1,1,1)

_FresnelVector ("手绘菲涅尔参数", Vector) = (1,1,0,0)

_Fresnel2Vector ("菲涅尔2参数", Vector) = (1,1,0,0)

_OutlineCullingMode ("深度剔除模式", Float) = 2.0

[KeywordEnum(None, VertexColor, Uv1)] _SmoothNormal ("平滑法线来源", Float) = 0.0

_OutlineWidth ("描边宽度", Range(0, 0.4)) = 0.009999999776482582

_OutlineColor ("描边颜色", Color) = (0,0,0,0)

_ZWrite ("深度写入", Float) = 1.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 31459
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
bool u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
float u_xlat48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_37 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_37), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb18 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat58 * u_xlat58;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_3.x = u_xlat58 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat58 + 1.0;
    u_xlat5.xyz = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_21.xyz = (bool(u_xlatb18)) ? u_xlat5.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_5.zxy;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat18.x = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat18.xxx * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xzw * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat65;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat48 = (-u_xlat16_37) * u_xlat65 + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat13.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat5.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat13.xy = u_xlat0.xz * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat36 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat54 * u_xlat54;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat54 * u_xlat16_1.x;
    u_xlat54 = (-u_xlat16_1.x) * u_xlat54 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat54);
    u_xlat5.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat5.xyz;
    u_xlat18.x = (-u_xlat36) * u_xlat16_19.x + u_xlat36;
    u_xlat18.x = u_xlat36 * u_xlat18.x + u_xlat16_19.x;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat36;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat63;
    u_xlat0.y = float(1.0) / u_xlat18.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _directSpecularColor.zxy;
    u_xlat0.xyw = vec3(u_xlat36) * u_xlat0.xyw;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat0.xyw;
    u_xlat16_1.xzw = u_xlat0.xyw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * vec3(u_xlat36) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_24 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat13.z = u_xlat16_10.z;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat13.xyz);
    u_xlat22 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_24 = log2(u_xlat4.x);
    u_xlat16_10.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_10.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_10.x = u_xlat16_21.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_10.x = u_xlat16_3.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_4.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat4.x = u_xlat22 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_21.xyz = u_xlat16_8.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xzw;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xzw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.yzx * u_xlat16_6.zwx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_37 = cos(u_xlat0.x);
    u_xlat16_37 = max(abs(u_xlat16_37), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb54 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_37 = (u_xlatb54) ? u_xlat16_37 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_3.xyz * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_37 = u_xlat16_24 * _Fresnel2Vector.x;
    u_xlat16_55 = u_xlat16_24 * _FresnelVector.z;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_37 = exp2(u_xlat16_37);
    u_xlat16_56 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_3.x = u_xlat16_37 * u_xlat16_56;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Fresnel3Color.zxy;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_55 = u_xlat16_55 * u_xlat16_6.y;
    u_xlat16_3.xyz = vec3(u_xlat16_55) * _Fresnel2Color.zxy + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_57 = log2(u_xlat16_0.x);
    u_xlat16_57 = u_xlat16_57 * _FresnelVector.x;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_24 = u_xlat16_6.x * u_xlat16_57;
    u_xlat16_55 = u_xlat16_57 * u_xlat16_6.x + u_xlat16_55;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_56 + u_xlat16_55;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * _FresnelColor.zxy + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat2.x = u_xlat54 * 0.0625 + u_xlat2.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
    SV_Target0.w = u_xlat16_37 * _Fresnel2Vector.z + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
bool u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
float u_xlat48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_37 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_37), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb18 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat58 * u_xlat58;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_3.x = u_xlat58 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat58 + 1.0;
    u_xlat5.xyz = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_21.xyz = (bool(u_xlatb18)) ? u_xlat5.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_5.zxy;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat18.x = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat18.xxx * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xzw * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat65;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat48 = (-u_xlat16_37) * u_xlat65 + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat13.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat5.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat13.xy = u_xlat0.xz * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat36 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat54 * u_xlat54;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat54 * u_xlat16_1.x;
    u_xlat54 = (-u_xlat16_1.x) * u_xlat54 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat54);
    u_xlat5.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat5.xyz;
    u_xlat18.x = (-u_xlat36) * u_xlat16_19.x + u_xlat36;
    u_xlat18.x = u_xlat36 * u_xlat18.x + u_xlat16_19.x;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat36;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat63;
    u_xlat0.y = float(1.0) / u_xlat18.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _directSpecularColor.zxy;
    u_xlat0.xyw = vec3(u_xlat36) * u_xlat0.xyw;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat0.xyw;
    u_xlat16_1.xzw = u_xlat0.xyw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * vec3(u_xlat36) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_24 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat13.z = u_xlat16_10.z;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat13.xyz);
    u_xlat22 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_24 = log2(u_xlat4.x);
    u_xlat16_10.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_10.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_10.x = u_xlat16_21.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_10.x = u_xlat16_3.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_4.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat4.x = u_xlat22 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_21.xyz = u_xlat16_8.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xzw;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xzw = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.yzx * u_xlat16_6.zwx + u_xlat16_1.zwx;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_37 = cos(u_xlat0.x);
    u_xlat16_37 = max(abs(u_xlat16_37), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb54 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_37 = (u_xlatb54) ? u_xlat16_37 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_3.xyz * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_37 = u_xlat16_24 * _Fresnel2Vector.x;
    u_xlat16_55 = u_xlat16_24 * _FresnelVector.z;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_37 = exp2(u_xlat16_37);
    u_xlat16_56 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_3.x = u_xlat16_37 * u_xlat16_56;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Fresnel3Color.zxy;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_55 = u_xlat16_55 * u_xlat16_6.y;
    u_xlat16_3.xyz = vec3(u_xlat16_55) * _Fresnel2Color.zxy + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_57 = log2(u_xlat16_0.x);
    u_xlat16_57 = u_xlat16_57 * _FresnelVector.x;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_24 = u_xlat16_6.x * u_xlat16_57;
    u_xlat16_55 = u_xlat16_57 * u_xlat16_6.x + u_xlat16_55;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_56 + u_xlat16_55;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * _FresnelColor.zxy + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat2.x = u_xlat54 * 0.0625 + u_xlat2.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
    SV_Target0.w = u_xlat16_37 * _Fresnel2Vector.z + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump float u_xlat16_33;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_51;
float u_xlat60;
int u_xlati60;
bool u_xlatb60;
float u_xlat62;
mediump float u_xlat16_62;
bool u_xlatb62;
float u_xlat63;
float u_xlat64;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_41 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_41), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb20 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat60 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat60 = (-u_xlat60) * u_xlat60 + 1.0;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat60) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat60 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat60 = (-u_xlat0.x) + u_xlat60;
    u_xlat1.z = _ShadowBias.y * u_xlat60 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat60 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat60 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_11.xyz;
    u_xlat42 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat63 = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat63 * u_xlat63;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat63 * u_xlat16_11.x;
    u_xlat63 = (-u_xlat16_11.x) * u_xlat63 + 1.0;
    u_xlat4.xyz = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xzw = (bool(u_xlatb20)) ? u_xlat4.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_11.xzw + u_xlat16_1.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_5.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat16_13.xyz;
    u_xlat20 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_31.xxx + u_xlat9.xyz;
    u_xlat16_31.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat63 = (-u_xlat42) * u_xlat16_31.x + u_xlat42;
    u_xlat63 = u_xlat42 * u_xlat63 + u_xlat16_31.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat42 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat10.x) * u_xlat16_31.x + u_xlat10.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x + u_xlat16_31.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat4.x;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat64 = u_xlat16_31.x + -1.0;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat62 = u_xlat63 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat15.xyz = vec3(u_xlat62) * u_xlat15.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat63 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat63;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat66 = (-u_xlat16_72) * u_xlat63 + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat15.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat63 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat63) * u_xlat16_31.x + u_xlat63;
    u_xlat66 = u_xlat63 * u_xlat66 + u_xlat16_31.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat63 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat4.x * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat62 = u_xlat62 * u_xlat66;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat63) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat3.xy = u_xlat3.xy * vec2(u_xlat16_67) + _FresnelDir.xy;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat9.xyz;
    u_xlat16_67 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_67) + 1.0;
    u_xlat16_67 = u_xlat66 * u_xlat66;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_72 = u_xlat66 * u_xlat16_67;
    u_xlat66 = (-u_xlat16_67) * u_xlat66 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat9.xyz;
    u_xlat20 = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat20 = u_xlat64 * u_xlat20 + u_xlat16_31.x;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = u_xlat20 + u_xlat64;
    u_xlat20 = u_xlat20 + 6.10351563e-05;
    u_xlat20 = u_xlat20 * u_xlat4.x;
    u_xlat20 = float(1.0) / u_xlat20;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat20 = u_xlat20 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat20);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_18.xyz * u_xlat9.xyz;
    u_xlat16_16.xyz = u_xlat9.xyz * u_xlat2.yyy + u_xlat16_16.xyz;
    u_xlat16_67 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_67) * u_xlat16_11.xzw;
    u_xlat16_17.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat42) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat63) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_67) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_72 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_67;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat8.xyz) * u_xlat16_11.xxx + (-u_xlat16_14.xyz);
    u_xlat3.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat60 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyz);
    u_xlat16_11.xzw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.x = log2(u_xlat0.x);
    u_xlat16_3.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_3.w);
    u_xlat16_51 = u_xlat16_11.x + 1.0;
    u_xlat16_51 = min(u_xlat16_51, 15.0);
    u_xlat16_3.x = u_xlat16_51 * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_3.x = u_xlat16_11.x * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_51 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_51 + u_xlat16_62;
    u_xlat16_11.x = u_xlat16_72 * u_xlat16_11.x;
    u_xlat0.x = u_xlat60 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_51 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat0.x * u_xlat16_51 + u_xlat16_11.x;
    u_xlat16_51 = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_71 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_4.z, u_xlat16_11.x);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_32.xyz = u_xlat16_13.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_67) * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
    u_xlat16_32.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_32.yzx + u_xlat16_16.yzx;
    u_xlat16_67 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_1.w * _albedoColor.w + u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_31.x = cos(u_xlat0.x);
    u_xlat16_31.x = max(abs(u_xlat16_31.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb60 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_32.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_31.x = (u_xlatb60) ? u_xlat16_31.x : 1.0;
    u_xlat16_31.xyz = u_xlat16_31.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_31.x = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_51 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_31.x = exp2(u_xlat16_31.x);
    u_xlat16_71 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_71 * u_xlat16_31.x;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.zxy;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_51 = u_xlat16_51 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_51) * _Fresnel2Color.zxy + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_72 = log2(u_xlat16_0.x);
    u_xlat16_72 = u_xlat16_72 * _FresnelVector.x;
    u_xlat16_72 = exp2(u_xlat16_72);
    u_xlat16_33 = u_xlat16_13.x * u_xlat16_72;
    u_xlat16_51 = u_xlat16_72 * u_xlat16_13.x + u_xlat16_51;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_12.xyz = vec3(u_xlat16_33) * _FresnelColor.zxy + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_20.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_67 : u_xlat16_11.x;
    SV_Target0.w = u_xlat16_31.x * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
mediump vec3 u_xlat16_20;
bool u_xlatb20;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump float u_xlat16_33;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_51;
float u_xlat60;
int u_xlati60;
bool u_xlatb60;
float u_xlat62;
mediump float u_xlat16_62;
bool u_xlatb62;
float u_xlat63;
float u_xlat64;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_41 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_41), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb20 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat60 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat60 = (-u_xlat60) * u_xlat60 + 1.0;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat60) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat60 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat60 = (-u_xlat0.x) + u_xlat60;
    u_xlat1.z = _ShadowBias.y * u_xlat60 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat60 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat60 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_11.xyz;
    u_xlat42 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat63 = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat63 * u_xlat63;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat63 * u_xlat16_11.x;
    u_xlat63 = (-u_xlat16_11.x) * u_xlat63 + 1.0;
    u_xlat4.xyz = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xzw = (bool(u_xlatb20)) ? u_xlat4.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_11.xzw + u_xlat16_1.zxy;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_5.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat16_13.xyz;
    u_xlat20 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_31.xxx + u_xlat9.xyz;
    u_xlat16_31.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat63 = (-u_xlat42) * u_xlat16_31.x + u_xlat42;
    u_xlat63 = u_xlat42 * u_xlat63 + u_xlat16_31.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat42 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat10.x) * u_xlat16_31.x + u_xlat10.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x + u_xlat16_31.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat4.x;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat64 = u_xlat16_31.x + -1.0;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat62 = u_xlat63 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat15.xyz = vec3(u_xlat62) * u_xlat15.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat63 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat63;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat66 = (-u_xlat16_72) * u_xlat63 + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat15.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat63 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat63) * u_xlat16_31.x + u_xlat63;
    u_xlat66 = u_xlat63 * u_xlat66 + u_xlat16_31.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat63 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat4.x * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat62 = u_xlat62 * u_xlat66;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.zxy;
    u_xlat15.xyz = vec3(u_xlat63) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat3.xy = u_xlat3.xy * vec2(u_xlat16_67) + _FresnelDir.xy;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat9.xyz;
    u_xlat16_67 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_67) + 1.0;
    u_xlat16_67 = u_xlat66 * u_xlat66;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_72 = u_xlat66 * u_xlat16_67;
    u_xlat66 = (-u_xlat16_67) * u_xlat66 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat9.xyz;
    u_xlat20 = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat20 = u_xlat64 * u_xlat20 + u_xlat16_31.x;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = u_xlat20 + u_xlat64;
    u_xlat20 = u_xlat20 + 6.10351563e-05;
    u_xlat20 = u_xlat20 * u_xlat4.x;
    u_xlat20 = float(1.0) / u_xlat20;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat20 = u_xlat20 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat20);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_18.xyz * u_xlat9.xyz;
    u_xlat16_16.xyz = u_xlat9.xyz * u_xlat2.yyy + u_xlat16_16.xyz;
    u_xlat16_67 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_67) * u_xlat16_11.xzw;
    u_xlat16_17.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat42) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat63) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_67) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_72 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_67;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat8.xyz) * u_xlat16_11.xxx + (-u_xlat16_14.xyz);
    u_xlat3.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat60 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyz);
    u_xlat16_11.xzw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.x = log2(u_xlat0.x);
    u_xlat16_3.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_3.w);
    u_xlat16_51 = u_xlat16_11.x + 1.0;
    u_xlat16_51 = min(u_xlat16_51, 15.0);
    u_xlat16_3.x = u_xlat16_51 * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_3.x = u_xlat16_11.x * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_51 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_51 + u_xlat16_62;
    u_xlat16_11.x = u_xlat16_72 * u_xlat16_11.x;
    u_xlat0.x = u_xlat60 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_51 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat0.x * u_xlat16_51 + u_xlat16_11.x;
    u_xlat16_51 = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_71 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_4.z, u_xlat16_11.x);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_32.xyz = u_xlat16_13.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_67) * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
    u_xlat16_32.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_32.yzx + u_xlat16_16.yzx;
    u_xlat16_67 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_1.w * _albedoColor.w + u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_31.x = cos(u_xlat0.x);
    u_xlat16_31.x = max(abs(u_xlat16_31.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb60 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_32.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_31.x = (u_xlatb60) ? u_xlat16_31.x : 1.0;
    u_xlat16_31.xyz = u_xlat16_31.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_31.x = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_51 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_31.x = exp2(u_xlat16_31.x);
    u_xlat16_71 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_71 * u_xlat16_31.x;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.zxy;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_51 = u_xlat16_51 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_51) * _Fresnel2Color.zxy + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_72 = log2(u_xlat16_0.x);
    u_xlat16_72 = u_xlat16_72 * _FresnelVector.x;
    u_xlat16_72 = exp2(u_xlat16_72);
    u_xlat16_33 = u_xlat16_13.x * u_xlat16_72;
    u_xlat16_51 = u_xlat16_72 * u_xlat16_13.x + u_xlat16_51;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_12.xyz = vec3(u_xlat16_33) * _FresnelColor.zxy + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.zxy;
    u_xlat16_7.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat60 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat60);
    u_xlat1.x = u_xlat60 * 0.0625 + u_xlat1.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_20.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_67 : u_xlat16_11.x;
    SV_Target0.w = u_xlat16_31.x * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
bool u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
float u_xlat48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_37 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_37), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb18 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat58 * u_xlat58;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_3.x = u_xlat58 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat58 + 1.0;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_21.xyz = (bool(u_xlatb18)) ? u_xlat5.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat18.x = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat18.xxx * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xzw * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat65;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat48 = (-u_xlat16_37) * u_xlat65 + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat13.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat5.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat13.xy = u_xlat0.xz * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat36 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat54 * u_xlat54;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat54 * u_xlat16_1.x;
    u_xlat54 = (-u_xlat16_1.x) * u_xlat54 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat54);
    u_xlat5.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat5.xyz;
    u_xlat18.x = (-u_xlat36) * u_xlat16_19.x + u_xlat36;
    u_xlat18.x = u_xlat36 * u_xlat18.x + u_xlat16_19.x;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat36;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat63;
    u_xlat0.y = float(1.0) / u_xlat18.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _directSpecularColor.xyz;
    u_xlat0.xyw = vec3(u_xlat36) * u_xlat0.xyw;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat0.xyw;
    u_xlat16_1.xzw = u_xlat0.xyw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * vec3(u_xlat36) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_24 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat13.z = u_xlat16_10.z;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat13.xyz);
    u_xlat22 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_24 = log2(u_xlat4.x);
    u_xlat16_10.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_10.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_10.x = u_xlat16_21.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_10.x = u_xlat16_3.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_4.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat4.x = u_xlat22 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_21.xyz = u_xlat16_8.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xzw;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xzw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_37 = cos(u_xlat0.x);
    u_xlat16_37 = max(abs(u_xlat16_37), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb54 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_37 = (u_xlatb54) ? u_xlat16_37 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_3.xyz * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_37 = u_xlat16_24 * _Fresnel2Vector.x;
    u_xlat16_55 = u_xlat16_24 * _FresnelVector.z;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_37 = exp2(u_xlat16_37);
    u_xlat16_56 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_3.x = u_xlat16_37 * u_xlat16_56;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Fresnel3Color.xyz;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_55 = u_xlat16_55 * u_xlat16_6.y;
    u_xlat16_3.xyz = vec3(u_xlat16_55) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_57 = log2(u_xlat16_0.x);
    u_xlat16_57 = u_xlat16_57 * _FresnelVector.x;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_24 = u_xlat16_6.x * u_xlat16_57;
    u_xlat16_55 = u_xlat16_57 * u_xlat16_6.x + u_xlat16_55;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_56 + u_xlat16_55;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
    SV_Target0.w = u_xlat16_37 * _Fresnel2Vector.z + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
bool u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump vec2 u_xlat16_42;
float u_xlat48;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_37 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_37), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb18 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat4.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat58 * u_xlat58;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_56 = u_xlat58 * u_xlat16_56;
    u_xlat16_3.x = u_xlat58 * u_xlat16_56;
    u_xlat58 = (-u_xlat16_56) * u_xlat58 + 1.0;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_21.xyz = (bool(u_xlatb18)) ? u_xlat5.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_5 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_21.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat18.x = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat18.xxx * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xzw * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xzw * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat65;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat48 = (-u_xlat16_37) * u_xlat65 + 1.0;
    u_xlat16_37 = u_xlat65 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat48);
    u_xlat13.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37 = max(u_xlat16_37, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_15.xyz = vec3(u_xlat16_37) * u_xlat5.xyz;
    u_xlat16_37 = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37 = max(u_xlat16_37, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37 = u_xlat16_55 * u_xlat16_37;
    u_xlat16_16.xyz = vec3(u_xlat16_37) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat0.xzw * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat13.xy = u_xlat0.xz * u_xlat16_1.xx + _FresnelDir.xy;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat36 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat54 * u_xlat54;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat54 * u_xlat16_1.x;
    u_xlat16_37 = u_xlat54 * u_xlat16_1.x;
    u_xlat54 = (-u_xlat16_1.x) * u_xlat54 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat54);
    u_xlat5.xyz = u_xlat18.xxx * vec3(u_xlat16_37) + u_xlat5.xyz;
    u_xlat18.x = (-u_xlat36) * u_xlat16_19.x + u_xlat36;
    u_xlat18.x = u_xlat36 * u_xlat18.x + u_xlat16_19.x;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat36;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat63;
    u_xlat0.y = float(1.0) / u_xlat18.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.xyw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _directSpecularColor.xyz;
    u_xlat0.xyw = vec3(u_xlat36) * u_xlat0.xyw;
    u_xlat0.xyw = u_xlat16_16.xyz * u_xlat0.xyw;
    u_xlat16_1.xzw = u_xlat0.xyw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * vec3(u_xlat36) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat11.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_15.xyz = vec3(u_xlat16_56) * u_xlat16_15.xyz;
    u_xlat16_56 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_24 + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
    u_xlat16_57 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_57 = u_xlat16_57 + -1.0;
    u_xlat16_57 = _occlusionScale * u_xlat16_57 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_57;
    u_xlat0.x = min(u_xlat16_56, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat18.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_16.y = u_xlat16_15.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat13.z = u_xlat16_10.z;
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat13.xyz);
    u_xlat22 = dot(u_xlat16_15.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_15.xyz, u_xlat18.xyz);
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat4.x = (-u_xlat4.x) + 1.0;
    u_xlat4.x = max(u_xlat4.x, 0.0);
    u_xlat16_24 = log2(u_xlat4.x);
    u_xlat16_10.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_10.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_10.x = u_xlat16_21.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_10.x = u_xlat16_3.x * 16.0 + u_xlat16_10.z;
    u_xlat16_42.xy = u_xlat16_10.xy + vec2(0.5, 0.5);
    u_xlat16_42.xy = u_xlat16_42.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_42.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_4.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat4.x = u_xlat22 * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_21.xyz = u_xlat16_8.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_6.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xzw = u_xlat16_6.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_6.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xzw = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xzw;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xzw = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xzw = min(max(u_xlat16_6.xzw, 0.0), 1.0);
#else
    u_xlat16_6.xzw = clamp(u_xlat16_6.xzw, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_1.xzw;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_5.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_5.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_37 = cos(u_xlat0.x);
    u_xlat16_37 = max(abs(u_xlat16_37), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb54 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_37 = (u_xlatb54) ? u_xlat16_37 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_37) * u_xlat16_3.xyz;
    u_xlat16_6.xzw = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xzw = u_xlat16_3.xyz * u_xlat16_6.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xzw + u_xlat16_2.xyz;
    u_xlat16_37 = u_xlat16_24 * _Fresnel2Vector.x;
    u_xlat16_55 = u_xlat16_24 * _FresnelVector.z;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_37 = exp2(u_xlat16_37);
    u_xlat16_56 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_3.x = u_xlat16_37 * u_xlat16_56;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Fresnel3Color.xyz;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_55 = u_xlat16_55 * u_xlat16_6.y;
    u_xlat16_3.xyz = vec3(u_xlat16_55) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_57 = log2(u_xlat16_0.x);
    u_xlat16_57 = u_xlat16_57 * _FresnelVector.x;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_24 = u_xlat16_6.x * u_xlat16_57;
    u_xlat16_55 = u_xlat16_57 * u_xlat16_6.x + u_xlat16_55;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_56 + u_xlat16_55;
    u_xlat16_3.xyz = vec3(u_xlat16_24) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_19.x;
    SV_Target0.w = u_xlat16_37 * _Fresnel2Vector.z + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump float u_xlat16_33;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_51;
float u_xlat60;
int u_xlati60;
bool u_xlatb60;
float u_xlat62;
mediump float u_xlat16_62;
bool u_xlatb62;
float u_xlat63;
float u_xlat64;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_41 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_41), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb20 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat60 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat60 = (-u_xlat60) * u_xlat60 + 1.0;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat60) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat60 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat60 = (-u_xlat0.x) + u_xlat60;
    u_xlat1.z = _ShadowBias.y * u_xlat60 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat60 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat60 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_11.xyz;
    u_xlat42 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat63 = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat63 * u_xlat63;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat63 * u_xlat16_11.x;
    u_xlat63 = (-u_xlat16_11.x) * u_xlat63 + 1.0;
    u_xlat4.xyz = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xzw = (bool(u_xlatb20)) ? u_xlat4.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_11.xzw + u_xlat16_1.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_5.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat16_13.xyz;
    u_xlat20 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_31.xxx + u_xlat9.xyz;
    u_xlat16_31.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat63 = (-u_xlat42) * u_xlat16_31.x + u_xlat42;
    u_xlat63 = u_xlat42 * u_xlat63 + u_xlat16_31.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat42 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat10.x) * u_xlat16_31.x + u_xlat10.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x + u_xlat16_31.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat4.x;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat64 = u_xlat16_31.x + -1.0;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat62 = u_xlat63 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat15.xyz = vec3(u_xlat62) * u_xlat15.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat63 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat63;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat66 = (-u_xlat16_72) * u_xlat63 + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat15.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat63 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat63) * u_xlat16_31.x + u_xlat63;
    u_xlat66 = u_xlat63 * u_xlat66 + u_xlat16_31.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat63 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat4.x * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat62 = u_xlat62 * u_xlat66;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat63) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat3.xy = u_xlat3.xy * vec2(u_xlat16_67) + _FresnelDir.xy;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat9.xyz;
    u_xlat16_67 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_67) + 1.0;
    u_xlat16_67 = u_xlat66 * u_xlat66;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_72 = u_xlat66 * u_xlat16_67;
    u_xlat66 = (-u_xlat16_67) * u_xlat66 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat9.xyz;
    u_xlat20 = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat20 = u_xlat64 * u_xlat20 + u_xlat16_31.x;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = u_xlat20 + u_xlat64;
    u_xlat20 = u_xlat20 + 6.10351563e-05;
    u_xlat20 = u_xlat20 * u_xlat4.x;
    u_xlat20 = float(1.0) / u_xlat20;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat20 = u_xlat20 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat20);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_18.xyz * u_xlat9.xyz;
    u_xlat16_16.xyz = u_xlat9.xyz * u_xlat2.yyy + u_xlat16_16.xyz;
    u_xlat16_67 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_67) * u_xlat16_11.xzw;
    u_xlat16_17.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat42) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat63) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_67) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_72 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_67;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat8.xyz) * u_xlat16_11.xxx + (-u_xlat16_14.xyz);
    u_xlat3.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat60 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyz);
    u_xlat16_11.xzw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.x = log2(u_xlat0.x);
    u_xlat16_3.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_3.w);
    u_xlat16_51 = u_xlat16_11.x + 1.0;
    u_xlat16_51 = min(u_xlat16_51, 15.0);
    u_xlat16_3.x = u_xlat16_51 * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_3.x = u_xlat16_11.x * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_51 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_51 + u_xlat16_62;
    u_xlat16_11.x = u_xlat16_72 * u_xlat16_11.x;
    u_xlat0.x = u_xlat60 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_51 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat0.x * u_xlat16_51 + u_xlat16_11.x;
    u_xlat16_51 = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_71 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_4.z, u_xlat16_11.x);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_32.xyz = u_xlat16_13.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_67) * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
    u_xlat16_32.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_32.xyz + u_xlat16_16.xyz;
    u_xlat16_67 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_1.w * _albedoColor.w + u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_31.x = cos(u_xlat0.x);
    u_xlat16_31.x = max(abs(u_xlat16_31.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb60 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_32.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_31.x = (u_xlatb60) ? u_xlat16_31.x : 1.0;
    u_xlat16_31.xyz = u_xlat16_31.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_31.x = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_51 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_31.x = exp2(u_xlat16_31.x);
    u_xlat16_71 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_71 * u_xlat16_31.x;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.xyz;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_51 = u_xlat16_51 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_51) * _Fresnel2Color.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_72 = log2(u_xlat16_0.x);
    u_xlat16_72 = u_xlat16_72 * _FresnelVector.x;
    u_xlat16_72 = exp2(u_xlat16_72);
    u_xlat16_33 = u_xlat16_13.x * u_xlat16_72;
    u_xlat16_51 = u_xlat16_72 * u_xlat16_13.x + u_xlat16_51;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_12.xyz = vec3(u_xlat16_33) * _FresnelColor.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_67 : u_xlat16_11.x;
    SV_Target0.w = u_xlat16_31.x * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec3 u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec2 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
float u_xlat20;
bool u_xlatb20;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_32;
mediump float u_xlat16_33;
float u_xlat40;
mediump float u_xlat16_41;
float u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_51;
float u_xlat60;
int u_xlati60;
bool u_xlatb60;
float u_xlat62;
mediump float u_xlat16_62;
bool u_xlatb62;
float u_xlat63;
float u_xlat64;
float u_xlat66;
mediump float u_xlat16_67;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
mediump float u_xlat16_74;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_41 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_41), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb20 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat5.xyz = vec3(u_xlat40) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat40 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 1.17549435e-38);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat8.xyz = vec3(u_xlat40) * u_xlat6.xyz;
    u_xlat60 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat60 = (-u_xlat60) * u_xlat60 + 1.0;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat60 = u_xlat60 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat60) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat60 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat60 = (-u_xlat0.x) + u_xlat60;
    u_xlat1.z = _ShadowBias.y * u_xlat60 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat60 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat60 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_11.x = u_xlat16_67 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_11.x = (-u_xlat16_11.x) * u_xlat16_11.x + 1.0;
    u_xlat16_11.x = max(u_xlat16_11.x, 0.0);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
    u_xlat16_31.x = float(1.0) / float(u_xlat16_67);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = u_xlat16_11.x * u_xlat16_31.x;
    u_xlat16_11.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.00100000005>=abs(u_xlat16_11.x));
#else
    u_xlatb42 = 0.00100000005>=abs(u_xlat16_11.x);
#endif
    u_xlat16_11.xy = (bool(u_xlatb42)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_11.x);
    u_xlat16_11.xzw = u_xlat16_11.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_11.yyy + u_xlat16_11.xzw;
    u_xlat16_71 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_11.xyz);
    u_xlat16_71 = u_xlat16_71 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb42 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_12.x = (u_xlatb42) ? 1.0 : 0.0;
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_12.x);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_71;
    u_xlat16_12.xyz = vec3(u_xlat16_67) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_11.xyz;
    u_xlat42 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat4.xyz = vec3(u_xlat42) * u_xlat4.xyz;
    u_xlat16_71 = dot(u_xlat16_11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat42 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat42 = min(max(u_xlat42, 0.0), 1.0);
#else
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat63 = (-u_xlat16_71) + 1.0;
    u_xlat16_11.x = u_xlat63 * u_xlat63;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat63 * u_xlat16_11.x;
    u_xlat16_31.x = u_xlat63 * u_xlat16_11.x;
    u_xlat63 = (-u_xlat16_11.x) * u_xlat63 + 1.0;
    u_xlat4.xyz = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xzw = (bool(u_xlatb20)) ? u_xlat4.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xzw = u_xlat16_11.xzw + u_xlat16_1.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xzw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_11.xzw * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_13.xyz;
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_5.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat63) * u_xlat16_13.xyz;
    u_xlat20 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat20) * u_xlat16_31.xxx + u_xlat9.xyz;
    u_xlat16_31.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0078125);
    u_xlat63 = (-u_xlat42) * u_xlat16_31.x + u_xlat42;
    u_xlat63 = u_xlat42 * u_xlat63 + u_xlat16_31.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat42 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_67);
    u_xlat10.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat4.x = (-u_xlat10.x) * u_xlat16_31.x + u_xlat10.x;
    u_xlat4.x = u_xlat10.x * u_xlat4.x + u_xlat16_31.x;
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x + u_xlat10.x;
    u_xlat4.x = u_xlat4.x + 6.10351563e-05;
    u_xlat63 = u_xlat63 * u_xlat4.x;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat64 = u_xlat16_31.x + -1.0;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat62 = u_xlat63 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat42) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat2.xxx * u_xlat9.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat15.xyz = vec3(u_xlat62) * u_xlat15.xyz;
    u_xlat16_72 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat63 = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat63;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat66 = (-u_xlat16_72) * u_xlat63 + 1.0;
    u_xlat16_72 = u_xlat63 * u_xlat16_72;
    u_xlat15.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat15.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat63 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat63) * u_xlat16_31.x + u_xlat63;
    u_xlat66 = u_xlat63 * u_xlat66 + u_xlat16_31.x;
    u_xlat66 = sqrt(u_xlat66);
    u_xlat66 = u_xlat63 + u_xlat66;
    u_xlat66 = u_xlat66 + 6.10351563e-05;
    u_xlat66 = u_xlat4.x * u_xlat66;
    u_xlat66 = float(1.0) / u_xlat66;
    u_xlat66 = min(u_xlat66, 16.0);
    u_xlat62 = u_xlat62 * u_xlat66;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor.xyz;
    u_xlat15.xyz = vec3(u_xlat63) * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_7.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_17.xyz = u_xlat9.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat9.xyz = u_xlat3.xyz * vec3(u_xlat16_67) + u_xlat16_17.xyz;
    u_xlat3.xy = u_xlat3.xy * vec2(u_xlat16_67) + _FresnelDir.xy;
    u_xlat62 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat9.xyz;
    u_xlat16_67 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat8.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat64 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_31.x / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat64 = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat16_67) + 1.0;
    u_xlat16_67 = u_xlat66 * u_xlat66;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_67 = u_xlat66 * u_xlat16_67;
    u_xlat16_72 = u_xlat66 * u_xlat16_67;
    u_xlat66 = (-u_xlat16_67) * u_xlat66 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat66);
    u_xlat9.xyz = vec3(u_xlat20) * vec3(u_xlat16_72) + u_xlat9.xyz;
    u_xlat20 = (-u_xlat64) * u_xlat16_31.x + u_xlat64;
    u_xlat20 = u_xlat64 * u_xlat20 + u_xlat16_31.x;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = u_xlat20 + u_xlat64;
    u_xlat20 = u_xlat20 + 6.10351563e-05;
    u_xlat20 = u_xlat20 * u_xlat4.x;
    u_xlat20 = float(1.0) / u_xlat20;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat20 = u_xlat20 * u_xlat62;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat20);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat64) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_18.xyz * u_xlat9.xyz;
    u_xlat16_16.xyz = u_xlat9.xyz * u_xlat2.yyy + u_xlat16_16.xyz;
    u_xlat16_67 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xzw = vec3(u_xlat16_67) * u_xlat16_11.xzw;
    u_xlat16_17.xyz = u_xlat16_11.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_17.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = vec3(u_xlat42) * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(u_xlat63) + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_18.xyz * u_xlat16_11.xzw;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat2.yyy * u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat64) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_16.xyz + u_xlat16_7.xyz;
    u_xlat16_12.xyz = (-u_xlat6.xyz) * vec3(u_xlat40) + vs_TEXCOORD4.xyz;
    u_xlat16_12.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat16_12.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_12.xyz = vec3(u_xlat16_67) * u_xlat16_12.xyz;
    u_xlat16_67 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_67) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_5.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_72 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_5.w * u_xlat16_67;
    u_xlat16_72 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 + -1.0;
    u_xlat16_72 = _occlusionScale * u_xlat16_72 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_72;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_17.xyz = u_xlat16_11.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_11.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_12.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_12.xz);
    u_xlat16_18.y = u_xlat16_12.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati2.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlati60 = (u_xlati2.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati60].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xzw = u_xlat16_11.xzw * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xzw * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_11.x = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat2.xyz = (-u_xlat8.xyz) * u_xlat16_11.xxx + (-u_xlat16_14.xyz);
    u_xlat3.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat3.xyz);
    u_xlat60 = dot(u_xlat16_12.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_5.z = dot(u_xlat16_12.xyz, u_xlat2.xyz);
    u_xlat16_11.xzw = u_xlat16_5.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xzw = min(max(u_xlat16_11.xzw, 0.0), 1.0);
#else
    u_xlat16_11.xzw = clamp(u_xlat16_11.xzw, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_12.x = log2(u_xlat0.x);
    u_xlat16_3.yzw = u_xlat16_11.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_3.w);
    u_xlat16_51 = u_xlat16_11.x + 1.0;
    u_xlat16_51 = min(u_xlat16_51, 15.0);
    u_xlat16_3.x = u_xlat16_51 * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_3.x = u_xlat16_11.x * 16.0 + u_xlat16_3.z;
    u_xlat16_32.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_11.x = u_xlat16_11.w * 15.0 + (-u_xlat16_11.x);
    u_xlat16_51 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_51 + u_xlat16_62;
    u_xlat16_11.x = u_xlat16_72 * u_xlat16_11.x;
    u_xlat0.x = u_xlat60 * u_xlat16_11.x;
    u_xlat16_11.x = u_xlat0.y * 0.5;
    u_xlat16_51 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_11.x = u_xlat0.x * u_xlat16_51 + u_xlat16_11.x;
    u_xlat16_51 = u_xlat16_11.x + u_xlat16_11.x;
    u_xlat16_71 = (-u_xlat16_11.x) * 2.0 + 1.0;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_11.x = u_xlat0.y * u_xlat16_11.x;
    u_xlat16_11.x = min(u_xlat16_4.z, u_xlat16_11.x);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat40) + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat16_31.xxx * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_31.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_31.x;
    u_xlat16_31.x = u_xlat16_5.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_5.x);
    u_xlat10.y = u_xlat16_5.x;
    u_xlat16_2.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_32.xyz = u_xlat16_13.xyz * u_xlat16_2.xxx + u_xlat16_2.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_31.x);
    u_xlat16_31.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_31.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_31.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_13.xyz = vec3(u_xlat16_67) * u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_31.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_31.xyz;
    u_xlat16_32.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_11.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_32.xyz + u_xlat16_16.xyz;
    u_xlat16_67 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_1.w * _albedoColor.w + u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_31.x = cos(u_xlat0.x);
    u_xlat16_31.x = max(abs(u_xlat16_31.x), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb60 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_32.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_31.x = (u_xlatb60) ? u_xlat16_31.x : 1.0;
    u_xlat16_31.xyz = u_xlat16_31.xxx * u_xlat16_32.xyz;
    u_xlat16_32.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_32.xyz + u_xlat16_7.xyz;
    u_xlat16_31.x = u_xlat16_12.x * _Fresnel2Vector.x;
    u_xlat16_51 = u_xlat16_12.x * _FresnelVector.z;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_31.x = exp2(u_xlat16_31.x);
    u_xlat16_71 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_71 * u_xlat16_31.x;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.xyz;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_51 = u_xlat16_51 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_51) * _Fresnel2Color.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_72 = log2(u_xlat16_0.x);
    u_xlat16_72 = u_xlat16_72 * _FresnelVector.x;
    u_xlat16_72 = exp2(u_xlat16_72);
    u_xlat16_33 = u_xlat16_13.x * u_xlat16_72;
    u_xlat16_51 = u_xlat16_72 * u_xlat16_13.x + u_xlat16_51;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_71 + u_xlat16_51;
    u_xlat16_12.xyz = vec3(u_xlat16_33) * _FresnelColor.xyz + u_xlat16_12.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_7.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_67 : u_xlat16_11.x;
    SV_Target0.w = u_xlat16_31.x * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
float u_xlat21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
float u_xlat48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
mediump float u_xlat16_54;
float u_xlat55;
float u_xlat58;
int u_xlati58;
int u_xlati59;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_33.x = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(u_xlat16_33.xx, vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb16 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xzw = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_3.xyz = (bool(u_xlatb16)) ? u_xlat0.xzw : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_0.zxy;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_49 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_50 = max(u_xlat16_50, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_50);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat7.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_8.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_51 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_51 = u_xlat16_51 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_51);
    u_xlat16_51 = u_xlat16_50 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_50 = float(1.0) / float(u_xlat16_50);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_51;
    u_xlat16_50 = max(u_xlat16_8.x, u_xlat16_50);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_50;
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_49 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_49) + vs_TEXCOORD2.yzx;
    u_xlat53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = vec3(u_xlat53) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat53 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat53);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat55 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat55) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_49 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_49) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat21 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat11.xyz = vec3(u_xlat21) * u_xlat11.xyz;
    u_xlat16_18 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat21 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat58 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat58;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.x = (-u_xlat16_18) * u_xlat58 + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat5.xxx * vec3(u_xlat16_18) + u_xlat11.xyz;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat5.x = (-u_xlat55) * u_xlat16_18 + u_xlat55;
    u_xlat5.x = u_xlat55 * u_xlat5.x + u_xlat16_18;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat55;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat16_6.xyz = vec3(u_xlat16_49) * u_xlat10.xyz;
    u_xlat10.xy = u_xlat10.xy * vec2(u_xlat16_49) + _FresnelDir.xy;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat12.x) * u_xlat16_18 + u_xlat12.x;
    u_xlat58 = u_xlat12.x * u_xlat58 + u_xlat16_18;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat12.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat58;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat58 = u_xlat16_18 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat58 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_18 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat58 = u_xlat5.x * u_xlat5.y;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_9.xyz = vec3(u_xlat16_49) * u_xlat16_9.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_49 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_49) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_51 + u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_49;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_52 = u_xlat16_49 * u_xlat16_51;
    u_xlat55 = min(u_xlat16_52, 1.0);
    u_xlat58 = min(u_xlat16_5.z, u_xlat55);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat58);
    u_xlat16_8.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat58) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_13.y = u_xlat16_9.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati59 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_52 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_54 = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_54 = u_xlat16_54 + u_xlat16_54;
    u_xlat15.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_54) + (-u_xlat16_6.xyz);
    u_xlat10.z = u_xlat16_6.z;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat15.xyz);
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat23 = max(u_xlat10.x, 0.0);
    u_xlat23 = (-u_xlat23) + 1.0;
    u_xlat23 = max(u_xlat23, 0.0);
    u_xlat16_34 = log2(u_xlat23);
    u_xlat16_1.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_50 = floor(u_xlat16_1.w);
    u_xlat16_6.x = u_xlat16_50 + 1.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 15.0);
    u_xlat16_1.x = u_xlat16_6.x * 16.0 + u_xlat16_1.z;
    u_xlat16_6.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_1.x = u_xlat16_50 * 16.0 + u_xlat16_1.z;
    u_xlat16_6.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_50 = u_xlat16_6.z * 15.0 + (-u_xlat16_50);
    u_xlat16_6.x = (-u_xlat16_39) + u_xlat16_23;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_6.x + u_xlat16_39;
    u_xlat16_50 = u_xlat16_51 * u_xlat16_50;
    u_xlat7.x = u_xlat7.x * u_xlat16_50;
    u_xlat16_50 = u_xlat55 * 0.5;
    u_xlat16_51 = (-u_xlat55) * 0.5 + 1.0;
    u_xlat16_50 = u_xlat7.x * u_xlat16_51 + u_xlat16_50;
    u_xlat16_51 = u_xlat16_50 + u_xlat16_50;
    u_xlat16_6.x = (-u_xlat16_50) * 2.0 + 1.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_6.x + u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat55;
    u_xlat16_50 = min(u_xlat16_50, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_18 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_18;
    u_xlat16_18 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_18);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyw = vec3(u_xlat16_50) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyw * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat11.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.ywx;
    u_xlat16_2.x = dot(u_xlat16_2.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_50 = cos(u_xlat0.x);
    u_xlat16_50 = max(abs(u_xlat16_50), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb48 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_50 = (u_xlatb48) ? u_xlat16_50 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_50) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_4.xyz;
    u_xlat16_50 = u_xlat16_34 * _Fresnel2Vector.x;
    u_xlat16_34 = u_xlat16_34 * _FresnelVector.z;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_50 = exp2(u_xlat16_50);
    u_xlat16_51 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_4.x = u_xlat16_50 * u_xlat16_51;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _Fresnel3Color.zxy;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_34 = u_xlat16_34 * u_xlat16_6.y;
    u_xlat16_4.xyz = vec3(u_xlat16_34) * _Fresnel2Color.zxy + u_xlat16_4.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_0.yyy;
    u_xlat16_52 = log2(u_xlat16_0.x);
    u_xlat16_52 = u_xlat16_52 * _FresnelVector.x;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_22 = u_xlat16_6.x * u_xlat16_52;
    u_xlat16_34 = u_xlat16_52 * u_xlat16_6.x + u_xlat16_34;
    u_xlat16_34 = u_xlat16_50 * u_xlat16_51 + u_xlat16_34;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * _FresnelColor.zxy + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat48 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat1.x = u_xlat48 * 0.0625 + u_xlat1.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_16.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_2.x = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_18;
    SV_Target0.w = u_xlat16_34 * _Fresnel2Vector.z + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
float u_xlat21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_23;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
mediump float u_xlat16_39;
float u_xlat48;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
mediump float u_xlat16_54;
float u_xlat55;
float u_xlat58;
int u_xlati58;
int u_xlati59;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_33.x = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(u_xlat16_33.xx, vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb16 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xzw = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_3.xyz = (bool(u_xlatb16)) ? u_xlat0.xzw : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_0.zxy;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_49 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_50 = max(u_xlat16_50, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_50);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat7.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_8.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_51 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_51 = u_xlat16_51 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_51);
    u_xlat16_51 = u_xlat16_50 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_50 = float(1.0) / float(u_xlat16_50);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_51;
    u_xlat16_50 = max(u_xlat16_8.x, u_xlat16_50);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_50;
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_49 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_49) + vs_TEXCOORD2.yzx;
    u_xlat53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = vec3(u_xlat53) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat53 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat53);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat55 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat55) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_49 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_49) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat21 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat11.xyz = vec3(u_xlat21) * u_xlat11.xyz;
    u_xlat16_18 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat21 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat58 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat58;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.x = (-u_xlat16_18) * u_xlat58 + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat5.xxx * vec3(u_xlat16_18) + u_xlat11.xyz;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat5.x = (-u_xlat55) * u_xlat16_18 + u_xlat55;
    u_xlat5.x = u_xlat55 * u_xlat5.x + u_xlat16_18;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat55;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat16_6.xyz = vec3(u_xlat16_49) * u_xlat10.xyz;
    u_xlat10.xy = u_xlat10.xy * vec2(u_xlat16_49) + _FresnelDir.xy;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat12.x) * u_xlat16_18 + u_xlat12.x;
    u_xlat58 = u_xlat12.x * u_xlat58 + u_xlat16_18;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat12.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat58;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat58 = u_xlat16_18 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat58 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_18 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat58 = u_xlat5.x * u_xlat5.y;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_9.xyz = vec3(u_xlat16_49) * u_xlat16_9.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_49 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_49) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_51 + u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_49;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_52 = u_xlat16_49 * u_xlat16_51;
    u_xlat55 = min(u_xlat16_52, 1.0);
    u_xlat58 = min(u_xlat16_5.z, u_xlat55);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat58);
    u_xlat16_8.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat58) * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat58) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(u_xlat58) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_13.y = u_xlat16_9.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati59 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati59].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_52 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_54 = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_54 = u_xlat16_54 + u_xlat16_54;
    u_xlat15.xyz = (-u_xlat7.xyz) * vec3(u_xlat16_54) + (-u_xlat16_6.xyz);
    u_xlat10.z = u_xlat16_6.z;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat15.xyz);
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat23 = max(u_xlat10.x, 0.0);
    u_xlat23 = (-u_xlat23) + 1.0;
    u_xlat23 = max(u_xlat23, 0.0);
    u_xlat16_34 = log2(u_xlat23);
    u_xlat16_1.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_50 = floor(u_xlat16_1.w);
    u_xlat16_6.x = u_xlat16_50 + 1.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 15.0);
    u_xlat16_1.x = u_xlat16_6.x * 16.0 + u_xlat16_1.z;
    u_xlat16_6.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_1.x = u_xlat16_50 * 16.0 + u_xlat16_1.z;
    u_xlat16_6.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_39 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_50 = u_xlat16_6.z * 15.0 + (-u_xlat16_50);
    u_xlat16_6.x = (-u_xlat16_39) + u_xlat16_23;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_6.x + u_xlat16_39;
    u_xlat16_50 = u_xlat16_51 * u_xlat16_50;
    u_xlat7.x = u_xlat7.x * u_xlat16_50;
    u_xlat16_50 = u_xlat55 * 0.5;
    u_xlat16_51 = (-u_xlat55) * 0.5 + 1.0;
    u_xlat16_50 = u_xlat7.x * u_xlat16_51 + u_xlat16_50;
    u_xlat16_51 = u_xlat16_50 + u_xlat16_50;
    u_xlat16_6.x = (-u_xlat16_50) * 2.0 + 1.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_6.x + u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat55;
    u_xlat16_50 = min(u_xlat16_50, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_18 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_18;
    u_xlat16_18 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_7.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xxx + u_xlat16_7.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_18);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_52) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyw = vec3(u_xlat16_50) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyw * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat11.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.ywx;
    u_xlat16_2.x = dot(u_xlat16_2.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_50 = cos(u_xlat0.x);
    u_xlat16_50 = max(abs(u_xlat16_50), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb48 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_50 = (u_xlatb48) ? u_xlat16_50 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_50) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_4.xyz;
    u_xlat16_50 = u_xlat16_34 * _Fresnel2Vector.x;
    u_xlat16_34 = u_xlat16_34 * _FresnelVector.z;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_50 = exp2(u_xlat16_50);
    u_xlat16_51 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_4.x = u_xlat16_50 * u_xlat16_51;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _Fresnel3Color.zxy;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_34 = u_xlat16_34 * u_xlat16_6.y;
    u_xlat16_4.xyz = vec3(u_xlat16_34) * _Fresnel2Color.zxy + u_xlat16_4.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_0.yyy;
    u_xlat16_52 = log2(u_xlat16_0.x);
    u_xlat16_52 = u_xlat16_52 * _FresnelVector.x;
    u_xlat16_52 = exp2(u_xlat16_52);
    u_xlat16_22 = u_xlat16_6.x * u_xlat16_52;
    u_xlat16_34 = u_xlat16_52 * u_xlat16_6.x + u_xlat16_34;
    u_xlat16_34 = u_xlat16_50 * u_xlat16_51 + u_xlat16_34;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * _FresnelColor.zxy + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_4.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat48 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat1.x = u_xlat48 * 0.0625 + u_xlat1.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat7.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat7.xy, 0.0).xyz;
    u_xlat7.xyz = (-u_xlat16_16.xyz) + u_xlat16_7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_2.x = (u_xlatb0) ? u_xlat16_2.x : u_xlat16_18;
    SV_Target0.w = u_xlat16_34 * _Fresnel2Vector.z + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
float u_xlat22;
mediump float u_xlat16_26;
mediump float u_xlat16_32;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_45;
float u_xlat57;
int u_xlati57;
bool u_xlatb57;
float u_xlat60;
float u_xlat61;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_39 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_39), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb19 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat6.xyz;
    u_xlat57 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat57 = (-u_xlat57) * u_xlat57 + 1.0;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat57) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat57 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat57 = (-u_xlat0.x) + u_xlat57;
    u_xlat1.z = _ShadowBias.y * u_xlat57 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat57 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat57 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_1.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat19 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat19 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat2.xzw * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat2.xxx + u_xlat16_13.xyz;
    u_xlat16_2.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_2.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.x = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat8.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat60 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat60;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat61 = (-u_xlat16_68) * u_xlat60 + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat5.xyz = u_xlat16_11.xyz * vec3(u_xlat61);
    u_xlat5.xyz = u_xlat3.xxx * vec3(u_xlat16_68) + u_xlat5.xyz;
    u_xlat16_68 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat3.x = (-u_xlat19) * u_xlat16_68 + u_xlat19;
    u_xlat3.x = u_xlat19 * u_xlat3.x + u_xlat16_68;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat19 + u_xlat3.x;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_64);
    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat16_64) + _FresnelDir.xy;
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat9.x) * u_xlat16_68 + u_xlat9.x;
    u_xlat60 = u_xlat9.x * u_xlat60 + u_xlat16_68;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat3.w = u_xlat60 + u_xlat9.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat60 = u_xlat16_68 + -1.0;
    u_xlat22 = u_xlat22 * u_xlat60 + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat16_68 / u_xlat22;
    u_xlat3.y = u_xlat22 * 0.318309873;
    u_xlat3.xy = min(u_xlat3.xy, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.xyw = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.zxy;
    u_xlat3.xyw = vec3(u_xlat19) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat3.xyw * u_xlat16_7.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_64) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_69 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_64;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_69;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati57 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat5.xyz = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_14.xyz);
    u_xlat4.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat4.xyz);
    u_xlat57 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat16_13.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_70 = log2(u_xlat0.x);
    u_xlat16_4.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_4.w);
    u_xlat16_32 = u_xlat16_13.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_4.x = u_xlat16_32 * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_4.x = u_xlat16_13.x * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32 + u_xlat16_62;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat0.x = u_xlat57 * u_xlat16_69;
    u_xlat16_69 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32 + u_xlat16_13.x;
    u_xlat16_69 = u_xlat0.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat38) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_68) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_68 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_68;
    u_xlat16_68 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_68);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat3.ywx * u_xlat16_7.yzx + u_xlat16_11.yzx;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_45 = cos(u_xlat0.x);
    u_xlat16_45 = max(abs(u_xlat16_45), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_45 = (u_xlatb57) ? u_xlat16_45 : 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_45) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_45 = u_xlat16_70 * _Fresnel2Vector.x;
    u_xlat16_64 = u_xlat16_70 * _FresnelVector.z;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_68 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_45 * u_xlat16_68;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.zxy;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_64 = u_xlat16_64 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _Fresnel2Color.zxy + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_69 = log2(u_xlat16_0.x);
    u_xlat16_69 = u_xlat16_69 * _FresnelVector.x;
    u_xlat16_69 = exp2(u_xlat16_69);
    u_xlat16_32 = u_xlat16_13.x * u_xlat16_69;
    u_xlat16_64 = u_xlat16_69 * u_xlat16_13.x + u_xlat16_64;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_68 + u_xlat16_64;
    u_xlat16_12.xyz = vec3(u_xlat16_32) * _FresnelColor.zxy + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_19.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_7.x : u_xlat16_26;
    SV_Target0.w = u_xlat16_45 * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
float u_xlat22;
mediump float u_xlat16_26;
mediump float u_xlat16_32;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_45;
float u_xlat57;
int u_xlati57;
bool u_xlatb57;
float u_xlat60;
float u_xlat61;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_39 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_39), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb19 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat6.xyz;
    u_xlat57 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat57 = (-u_xlat57) * u_xlat57 + 1.0;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat57) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat57 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat57 = (-u_xlat0.x) + u_xlat57;
    u_xlat1.z = _ShadowBias.y * u_xlat57 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat57 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat57 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = _DissolveColor.zxy * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_1.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat19 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat19 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat2.xzw * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat2.xxx + u_xlat16_13.xyz;
    u_xlat16_2.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_2.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.x = u_xlat16_11.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat8.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat60 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat60;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat61 = (-u_xlat16_68) * u_xlat60 + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat5.xyz = u_xlat16_11.xyz * vec3(u_xlat61);
    u_xlat5.xyz = u_xlat3.xxx * vec3(u_xlat16_68) + u_xlat5.xyz;
    u_xlat16_68 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat3.x = (-u_xlat19) * u_xlat16_68 + u_xlat19;
    u_xlat3.x = u_xlat19 * u_xlat3.x + u_xlat16_68;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat19 + u_xlat3.x;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_64);
    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat16_64) + _FresnelDir.xy;
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat9.x) * u_xlat16_68 + u_xlat9.x;
    u_xlat60 = u_xlat9.x * u_xlat60 + u_xlat16_68;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat3.w = u_xlat60 + u_xlat9.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat60 = u_xlat16_68 + -1.0;
    u_xlat22 = u_xlat22 * u_xlat60 + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat16_68 / u_xlat22;
    u_xlat3.y = u_xlat22 * 0.318309873;
    u_xlat3.xy = min(u_xlat3.xy, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.xyw = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.zxy;
    u_xlat3.xyw = vec3(u_xlat19) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat3.xyw * u_xlat16_7.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_64) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_69 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_64;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_69;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.zxy;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati57 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat5.xyz = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_14.xyz);
    u_xlat4.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat4.xyz);
    u_xlat57 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat16_13.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_70 = log2(u_xlat0.x);
    u_xlat16_4.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_4.w);
    u_xlat16_32 = u_xlat16_13.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_4.x = u_xlat16_32 * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_4.x = u_xlat16_13.x * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32 + u_xlat16_62;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat0.x = u_xlat57 * u_xlat16_69;
    u_xlat16_69 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32 + u_xlat16_13.x;
    u_xlat16_69 = u_xlat0.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat38) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_68) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_68 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_68;
    u_xlat16_68 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_68);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat3.ywx * u_xlat16_7.yzx + u_xlat16_11.yzx;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_45 = cos(u_xlat0.x);
    u_xlat16_45 = max(abs(u_xlat16_45), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_45 = (u_xlatb57) ? u_xlat16_45 : 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_45) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_45 = u_xlat16_70 * _Fresnel2Vector.x;
    u_xlat16_64 = u_xlat16_70 * _FresnelVector.z;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_68 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_45 * u_xlat16_68;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.zxy;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_64 = u_xlat16_64 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _Fresnel2Color.zxy + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_69 = log2(u_xlat16_0.x);
    u_xlat16_69 = u_xlat16_69 * _FresnelVector.x;
    u_xlat16_69 = exp2(u_xlat16_69);
    u_xlat16_32 = u_xlat16_13.x * u_xlat16_69;
    u_xlat16_64 = u_xlat16_69 * u_xlat16_13.x + u_xlat16_64;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_68 + u_xlat16_64;
    u_xlat16_12.xyz = vec3(u_xlat16_32) * _FresnelColor.zxy + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.zxy;
    u_xlat16_11.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xyz = u_xlat16_11.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat57 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat57);
    u_xlat1.x = u_xlat57 * 0.0625 + u_xlat1.y;
    u_xlat16_19.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_19.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_19.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_7.x : u_xlat16_26;
    SV_Target0.w = u_xlat16_45 * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
float u_xlat21;
mediump float u_xlat16_21;
int u_xlati21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
float u_xlat55;
int u_xlati55;
float u_xlat58;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_33.x = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(u_xlat16_33.xx, vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb16 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xzw = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_3.xyz = (bool(u_xlatb16)) ? u_xlat0.xzw : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_49 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_50 = max(u_xlat16_50, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_50);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat7.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_8.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_51 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_51 = u_xlat16_51 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_51);
    u_xlat16_51 = u_xlat16_50 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_50 = float(1.0) / float(u_xlat16_50);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_51;
    u_xlat16_50 = max(u_xlat16_8.x, u_xlat16_50);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_50;
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_49 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_49) + vs_TEXCOORD2.yzx;
    u_xlat53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = vec3(u_xlat53) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat53 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat53);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat55 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat55) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_49 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_49) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat21 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat11.xyz = vec3(u_xlat21) * u_xlat11.xyz;
    u_xlat16_18 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat21 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat58 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat58;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.x = (-u_xlat16_18) * u_xlat58 + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat5.xxx * vec3(u_xlat16_18) + u_xlat11.xyz;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat5.x = (-u_xlat55) * u_xlat16_18 + u_xlat55;
    u_xlat5.x = u_xlat55 * u_xlat5.x + u_xlat16_18;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat55;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat16_6.xyz = vec3(u_xlat16_49) * u_xlat10.xyz;
    u_xlat10.xy = u_xlat10.xy * vec2(u_xlat16_49) + _FresnelDir.xy;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat12.x) * u_xlat16_18 + u_xlat12.x;
    u_xlat58 = u_xlat12.x * u_xlat58 + u_xlat16_18;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat12.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat58;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat58 = u_xlat16_18 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat58 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_18 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_9.xyz = vec3(u_xlat16_49) * u_xlat16_9.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_49 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_49) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_51 + u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_49;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_51;
    u_xlat5.x = min(u_xlat16_49, 1.0);
    u_xlat21 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_8.xyz = vec3(u_xlat21) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = vec3(u_xlat21) * u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat21) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(u_xlat21) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_13.y = u_xlat16_9.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati21 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati55 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_49 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat15.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat10.z = u_xlat16_6.z;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat15.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_34 = log2(u_xlat21);
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_50 = floor(u_xlat16_6.w);
    u_xlat16_4.x = u_xlat16_50 + 1.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 15.0);
    u_xlat16_6.x = u_xlat16_4.x * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_50 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_50 = u_xlat16_4.z * 15.0 + (-u_xlat16_50);
    u_xlat16_4.x = u_xlat16_21 + (-u_xlat16_23);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_4.x + u_xlat16_23;
    u_xlat16_50 = u_xlat16_51 * u_xlat16_50;
    u_xlat21 = u_xlat7.x * u_xlat16_50;
    u_xlat16_50 = u_xlat5.x * 0.5;
    u_xlat16_51 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_50 = u_xlat21 * u_xlat16_51 + u_xlat16_50;
    u_xlat16_51 = u_xlat16_50 + u_xlat16_50;
    u_xlat16_4.x = (-u_xlat16_50) * 2.0 + 1.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_4.x + u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat5.x;
    u_xlat16_50 = min(u_xlat16_50, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_18 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_18;
    u_xlat16_18 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_18);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyw = vec3(u_xlat16_50) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyw * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyw;
    u_xlat16_49 = dot(u_xlat16_2.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_18 = cos(u_xlat0.x);
    u_xlat16_18 = max(abs(u_xlat16_18), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb48 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_18 = (u_xlatb48) ? u_xlat16_18 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_18 = u_xlat16_34 * _Fresnel2Vector.x;
    u_xlat16_34 = u_xlat16_34 * _FresnelVector.z;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_18 = exp2(u_xlat16_18);
    u_xlat16_50 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_3.x = u_xlat16_50 * u_xlat16_18;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Fresnel3Color.xyz;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_34 = u_xlat16_34 * u_xlat16_6.y;
    u_xlat16_3.xyz = vec3(u_xlat16_34) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_51 = log2(u_xlat16_0.x);
    u_xlat16_51 = u_xlat16_51 * _FresnelVector.x;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_22 = u_xlat16_6.x * u_xlat16_51;
    u_xlat16_34 = u_xlat16_51 * u_xlat16_6.x + u_xlat16_34;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_50 + u_xlat16_34;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_49 : u_xlat16_2.x;
    SV_Target0.w = u_xlat16_18 * _Fresnel2Vector.z + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(9) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
bool u_xlatb16;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
float u_xlat21;
mediump float u_xlat16_21;
int u_xlati21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
bool u_xlatb48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
float u_xlat53;
float u_xlat55;
int u_xlati55;
float u_xlat58;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_33.x = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(u_xlat16_33.xx, vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb16 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xzw * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xzw = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_3.xyz = (bool(u_xlatb16)) ? u_xlat0.xzw : vec3(0.0, 0.0, 0.0);
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = u_xlat16_5.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_49 = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_0.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat0.xy = u_xlat16_0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.yyy * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_49 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_50 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_50 = max(u_xlat16_50, 6.10351563e-05);
    u_xlat16_51 = inversesqrt(u_xlat16_50);
    u_xlat16_6.xyz = vec3(u_xlat16_51) * u_xlat7.xyz;
    u_xlat16_51 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_51));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_51);
#endif
    u_xlat16_8.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_51 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_6.xyz);
    u_xlat16_51 = u_xlat16_51 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_49 = max(u_xlat16_49, u_xlat16_51);
    u_xlat16_51 = u_xlat16_50 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_50 = float(1.0) / float(u_xlat16_50);
    u_xlat16_51 = (-u_xlat16_51) * u_xlat16_51 + 1.0;
    u_xlat16_51 = max(u_xlat16_51, 0.0);
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_51;
    u_xlat16_50 = max(u_xlat16_8.x, u_xlat16_50);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_50;
    u_xlat16_8.xyz = vec3(u_xlat16_49) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_49 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_49) + vs_TEXCOORD2.yzx;
    u_xlat53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = vec3(u_xlat53) * u_xlat16_9.xyz;
    u_xlat10.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat10.x;
    u_xlat0.x = u_xlat7.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat10.x = u_xlat7.y;
    u_xlat7.y = u_xlat10.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_9.xyz, u_xlat7.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat53 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat53 = max(u_xlat53, 1.17549435e-38);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat7.xyz = u_xlat0.xyz * vec3(u_xlat53);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat55) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat55 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_8.xyz * vec3(u_xlat55) + u_xlat16_6.xyz;
    u_xlat10.x = dot(u_xlat7.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10.xxx + u_xlat16_6.xyz;
    u_xlat16_2.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_2.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_49 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat11.xyz = u_xlat10.xyz * vec3(u_xlat16_49) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat21 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat11.xyz = vec3(u_xlat21) * u_xlat11.xyz;
    u_xlat16_18 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat21 = dot(u_xlat7.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat58 = (-u_xlat16_18) + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat58;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.x = (-u_xlat16_18) * u_xlat58 + 1.0;
    u_xlat16_18 = u_xlat58 * u_xlat16_18;
    u_xlat11.xyz = u_xlat16_3.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat5.xxx * vec3(u_xlat16_18) + u_xlat11.xyz;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_18, 0.0078125);
    u_xlat5.x = (-u_xlat55) * u_xlat16_18 + u_xlat55;
    u_xlat5.x = u_xlat55 * u_xlat5.x + u_xlat16_18;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat55;
    u_xlat5.x = u_xlat5.x + 6.10351563e-05;
    u_xlat16_6.xyz = vec3(u_xlat16_49) * u_xlat10.xyz;
    u_xlat10.xy = u_xlat10.xy * vec2(u_xlat16_49) + _FresnelDir.xy;
    u_xlat12.x = dot(u_xlat7.xyz, u_xlat16_6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat12.x) * u_xlat16_18 + u_xlat12.x;
    u_xlat58 = u_xlat12.x * u_xlat58 + u_xlat16_18;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat12.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat5.x = u_xlat5.x * u_xlat58;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat58 = u_xlat16_18 + -1.0;
    u_xlat21 = u_xlat21 * u_xlat58 + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat16_18 / u_xlat21;
    u_xlat5.y = u_xlat21 * 0.318309873;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.x * u_xlat5.y;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = vec3(u_xlat55) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD4.xyz;
    u_xlat16_9.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_9.xyz + u_xlat7.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_49 = inversesqrt(u_xlat16_49);
    u_xlat16_9.xyz = vec3(u_xlat16_49) * u_xlat16_9.xyz;
    u_xlat16_49 = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_49 * 0.5 + 0.5;
    u_xlat16_51 = (-u_xlat16_49) + u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_51 + u_xlat16_49;
    u_xlat16_49 = u_xlat16_2.w * u_xlat16_49;
    u_xlat16_51 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = u_xlat16_51 + -1.0;
    u_xlat16_51 = _occlusionScale * u_xlat16_51 + 1.0;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_51;
    u_xlat5.x = min(u_xlat16_49, 1.0);
    u_xlat21 = min(u_xlat5.x, u_xlat16_5.z);
    u_xlat16_8.xyz = vec3(u_xlat21) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = vec3(u_xlat21) * u_xlat16_8.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat21) * u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(u_xlat21) + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(u_xlat21) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_9.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_9.xz);
    u_xlat16_13.y = u_xlat16_9.y;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlati21 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati21].xyz;
    u_xlati21 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati55 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati21].xyz + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati55].xyz + u_xlat16_13.xyw;
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_49 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_6.xyz), u_xlat7.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat15.xyz = (-u_xlat7.xyz) * u_xlat16_4.xxx + (-u_xlat16_6.xyz);
    u_xlat10.z = u_xlat16_6.z;
    u_xlat21 = dot(u_xlat7.xyz, u_xlat10.xyz);
    u_xlat7.x = dot(u_xlat16_9.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_9.xyz, u_xlat15.xyz);
    u_xlat16_4.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_34 = log2(u_xlat21);
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_50 = floor(u_xlat16_6.w);
    u_xlat16_4.x = u_xlat16_50 + 1.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 15.0);
    u_xlat16_6.x = u_xlat16_4.x * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_21 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_6.x = u_xlat16_50 * 16.0 + u_xlat16_6.z;
    u_xlat16_4.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_4.xy = u_xlat16_4.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_4.xy).x;
    u_xlat16_50 = u_xlat16_4.z * 15.0 + (-u_xlat16_50);
    u_xlat16_4.x = u_xlat16_21 + (-u_xlat16_23);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_4.x + u_xlat16_23;
    u_xlat16_50 = u_xlat16_51 * u_xlat16_50;
    u_xlat21 = u_xlat7.x * u_xlat16_50;
    u_xlat16_50 = u_xlat5.x * 0.5;
    u_xlat16_51 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_50 = u_xlat21 * u_xlat16_51 + u_xlat16_50;
    u_xlat16_51 = u_xlat16_50 + u_xlat16_50;
    u_xlat16_4.x = (-u_xlat16_50) * 2.0 + 1.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_4.x + u_xlat16_51;
    u_xlat16_50 = u_xlat16_50 * u_xlat5.x;
    u_xlat16_50 = min(u_xlat16_50, u_xlat16_5.z);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat53) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_18 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_18;
    u_xlat16_18 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_4 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_18);
    u_xlat16_6.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_49) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyw = vec3(u_xlat16_50) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyw * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_3.xyz;
    u_xlat16_2.xyw = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyw;
    u_xlat16_49 = dot(u_xlat16_2.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_0.w * _albedoColor.w + u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_18 = cos(u_xlat0.x);
    u_xlat16_18 = max(abs(u_xlat16_18), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb48 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_3.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_18 = (u_xlatb48) ? u_xlat16_18 : 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_18 = u_xlat16_34 * _Fresnel2Vector.x;
    u_xlat16_34 = u_xlat16_34 * _FresnelVector.z;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_18 = exp2(u_xlat16_18);
    u_xlat16_50 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_3.x = u_xlat16_50 * u_xlat16_18;
    u_xlat16_3.xyz = u_xlat16_3.xxx * _Fresnel3Color.xyz;
    u_xlat16_6.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_34 = u_xlat16_34 * u_xlat16_6.y;
    u_xlat16_3.xyz = vec3(u_xlat16_34) * _Fresnel2Color.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.yyy;
    u_xlat16_51 = log2(u_xlat16_0.x);
    u_xlat16_51 = u_xlat16_51 * _FresnelVector.x;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_22 = u_xlat16_6.x * u_xlat16_51;
    u_xlat16_34 = u_xlat16_51 * u_xlat16_6.x + u_xlat16_34;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_50 + u_xlat16_34;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * _FresnelColor.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_1.x = (u_xlatb0) ? u_xlat16_49 : u_xlat16_2.x;
    SV_Target0.w = u_xlat16_18 * _Fresnel2Vector.z + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat22;
mediump float u_xlat16_26;
mediump float u_xlat16_32;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_45;
float u_xlat57;
int u_xlati57;
bool u_xlatb57;
float u_xlat60;
float u_xlat61;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_39 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_39), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb19 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat6.xyz;
    u_xlat57 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat57 = (-u_xlat57) * u_xlat57 + 1.0;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat57) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat57 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat57 = (-u_xlat0.x) + u_xlat57;
    u_xlat1.z = _ShadowBias.y * u_xlat57 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat57 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat57 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_1.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat19 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat19 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat2.xzw * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat2.xxx + u_xlat16_13.xyz;
    u_xlat16_2.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_2.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.x = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat8.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat60 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat60;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat61 = (-u_xlat16_68) * u_xlat60 + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat5.xyz = u_xlat16_11.xyz * vec3(u_xlat61);
    u_xlat5.xyz = u_xlat3.xxx * vec3(u_xlat16_68) + u_xlat5.xyz;
    u_xlat16_68 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat3.x = (-u_xlat19) * u_xlat16_68 + u_xlat19;
    u_xlat3.x = u_xlat19 * u_xlat3.x + u_xlat16_68;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat19 + u_xlat3.x;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_64);
    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat16_64) + _FresnelDir.xy;
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat9.x) * u_xlat16_68 + u_xlat9.x;
    u_xlat60 = u_xlat9.x * u_xlat60 + u_xlat16_68;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat3.w = u_xlat60 + u_xlat9.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat60 = u_xlat16_68 + -1.0;
    u_xlat22 = u_xlat22 * u_xlat60 + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat16_68 / u_xlat22;
    u_xlat3.y = u_xlat22 * 0.318309873;
    u_xlat3.xy = min(u_xlat3.xy, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.xyw = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.xyz;
    u_xlat3.xyw = vec3(u_xlat19) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat3.xyw * u_xlat16_7.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_64) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_69 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_64;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_69;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati57 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat5.xyz = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_14.xyz);
    u_xlat4.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat4.xyz);
    u_xlat57 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat16_13.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_70 = log2(u_xlat0.x);
    u_xlat16_4.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_4.w);
    u_xlat16_32 = u_xlat16_13.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_4.x = u_xlat16_32 * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_4.x = u_xlat16_13.x * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32 + u_xlat16_62;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat0.x = u_xlat57 * u_xlat16_69;
    u_xlat16_69 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32 + u_xlat16_13.x;
    u_xlat16_69 = u_xlat0.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat38) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_68) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_68 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_68;
    u_xlat16_68 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_68);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat3.xyw * u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_45 = cos(u_xlat0.x);
    u_xlat16_45 = max(abs(u_xlat16_45), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_45 = (u_xlatb57) ? u_xlat16_45 : 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_45) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_45 = u_xlat16_70 * _Fresnel2Vector.x;
    u_xlat16_64 = u_xlat16_70 * _FresnelVector.z;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_68 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_45 * u_xlat16_68;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.xyz;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_64 = u_xlat16_64 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _Fresnel2Color.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_69 = log2(u_xlat16_0.x);
    u_xlat16_69 = u_xlat16_69 * _FresnelVector.x;
    u_xlat16_69 = exp2(u_xlat16_69);
    u_xlat16_32 = u_xlat16_13.x * u_xlat16_69;
    u_xlat16_64 = u_xlat16_69 * u_xlat16_13.x + u_xlat16_64;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_68 + u_xlat16_64;
    u_xlat16_12.xyz = vec3(u_xlat16_32) * _FresnelColor.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_7.x : u_xlat16_26;
    SV_Target0.w = u_xlat16_45 * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
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
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _Dissovle_Tiling_Offset;
uniform 	mediump float _Dissovle_Directional;
uniform 	mediump float _Dissovle_Use_2U;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissovleEdgeShrinkage;
uniform 	mediump float _DissovleTarilPower;
uniform 	mediump float _ClipAmount;
uniform 	mediump float _Dis_Width;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec2 _FresnelDir;
uniform 	mediump vec4 _Fresnel2Color;
uniform 	mediump vec4 _Fresnel3Color;
uniform 	mediump vec4 _FresnelVector;
uniform 	mediump vec4 _Fresnel2Vector;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _Dissolve_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _FresnelTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
float u_xlat19;
bool u_xlatb19;
float u_xlat22;
mediump float u_xlat16_26;
mediump float u_xlat16_32;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_45;
float u_xlat57;
int u_xlati57;
bool u_xlatb57;
float u_xlat60;
float u_xlat61;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Dissovle_Use_2U==1.0);
#else
    u_xlatb0 = _Dissovle_Use_2U==1.0;
#endif
    u_xlat16_1.xy = (bool(u_xlatb0)) ? vs_TEXCOORD4.xy : vs_TEXCOORD3.xy;
    u_xlat16_39 = _Dissovle_Directional * u_xlat16_1.y + _ClipAmount;
    u_xlat16_1.xy = u_xlat16_1.xy * _Dissovle_Tiling_Offset.xy + _Dissovle_Tiling_Offset.zw;
    u_xlat16_0.x = texture(_Dissolve_Tex, u_xlat16_1.xy).y;
    u_xlat16_1.x = dot(vec2(u_xlat16_39), vec2(_DissovleEdgeShrinkage));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissovleEdgeShrinkage);
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x<0.0);
#else
    u_xlatb0 = u_xlat16_1.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_Dis_Width>=u_xlat16_1.x);
#else
    u_xlatb19 = _Dis_Width>=u_xlat16_1.x;
#endif
    if(u_xlatb0){discard;}
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat38 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat5.xyz = vec3(u_xlat38) * u_xlat5.xyz;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat38 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat8.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat6.y = u_xlat9.x;
    u_xlat6.x = u_xlat8.z;
    u_xlat16_10.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat16_7.xyz, u_xlat6.xyz);
    u_xlat9.x = u_xlat8.y;
    u_xlat8.y = u_xlat9.z;
    u_xlat8.z = vs_TEXCOORD1.y;
    u_xlat6.y = dot(u_xlat16_7.xyz, u_xlat8.xyz);
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat6.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat38 = max(u_xlat38, 1.17549435e-38);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat6.xyz;
    u_xlat57 = dot(u_xlat8.xyz, u_xlat5.xyz);
    u_xlat57 = (-u_xlat57) * u_xlat57 + 1.0;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 * _ShadowBias.z;
    u_xlat5.xyz = (-u_xlat8.xyz) * vec3(u_xlat57) + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat5.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlat0.x = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.z;
    u_xlat57 = max((-u_xlat1.w), u_xlat0.x);
    u_xlat57 = (-u_xlat0.x) + u_xlat57;
    u_xlat1.z = _ShadowBias.y * u_xlat57 + u_xlat0.x;
    u_xlat2.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat1.xyw + u_xlat2.xyz;
    vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat1.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat57 = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat57 + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_2.z * _shadowStrength;
    u_xlat2.xy = u_xlat16_2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_7.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat16_7.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = _DissolveColor.xyz * vec3(vec3(_DissovleTarilPower, _DissovleTarilPower, _DissovleTarilPower));
    u_xlat16_11.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_1.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb19 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb19) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_68 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb19 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb19)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat19 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat19) * u_xlat16_14.xyz;
    u_xlat19 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat19) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb2 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat2.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_68 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat16_68 = max(u_xlat16_68, 6.10351563e-05);
    u_xlat16_69 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = u_xlat2.xzw * vec3(u_xlat16_69);
    u_xlat16_69 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.00100000005>=abs(u_xlat16_69));
#else
    u_xlatb2 = 0.00100000005>=abs(u_xlat16_69);
#endif
    u_xlat16_15.xy = (bool(u_xlatb2)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_69 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat2.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_69);
    u_xlat16_69 = u_xlat16_68 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_68 = float(1.0) / float(u_xlat16_68);
    u_xlat16_69 = (-u_xlat16_69) * u_xlat16_69 + 1.0;
    u_xlat16_69 = max(u_xlat16_69, 0.0);
    u_xlat16_69 = u_xlat16_69 * u_xlat16_69;
    u_xlat16_68 = u_xlat16_68 * u_xlat16_69;
    u_xlat16_68 = max(u_xlat16_15.x, u_xlat16_68);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_68;
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat2.xxx + u_xlat16_13.xyz;
    u_xlat16_2.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_11.xyz = u_xlat16_2.yyy * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.x = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat5.xyz = vec3(u_xlat22) * u_xlat5.xyz;
    u_xlat16_68 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat22 = dot(u_xlat8.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat60 = (-u_xlat16_68) + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat60;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat61 = (-u_xlat16_68) * u_xlat60 + 1.0;
    u_xlat16_68 = u_xlat60 * u_xlat16_68;
    u_xlat5.xyz = u_xlat16_11.xyz * vec3(u_xlat61);
    u_xlat5.xyz = u_xlat3.xxx * vec3(u_xlat16_68) + u_xlat5.xyz;
    u_xlat16_68 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_68 = max(u_xlat16_68, 0.0078125);
    u_xlat3.x = (-u_xlat19) * u_xlat16_68 + u_xlat19;
    u_xlat3.x = u_xlat19 * u_xlat3.x + u_xlat16_68;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat19 + u_xlat3.x;
    u_xlat16_14.xyz = u_xlat4.xyz * vec3(u_xlat16_64);
    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat16_64) + _FresnelDir.xy;
    u_xlat9.x = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat9.x) * u_xlat16_68 + u_xlat9.x;
    u_xlat60 = u_xlat9.x * u_xlat60 + u_xlat16_68;
    u_xlat60 = sqrt(u_xlat60);
    u_xlat3.w = u_xlat60 + u_xlat9.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat60 = u_xlat16_68 + -1.0;
    u_xlat22 = u_xlat22 * u_xlat60 + 1.0;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = u_xlat16_68 / u_xlat22;
    u_xlat3.y = u_xlat22 * 0.318309873;
    u_xlat3.xy = min(u_xlat3.xy, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.x * u_xlat3.y;
    u_xlat3.xyw = u_xlat5.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat3.xyw * _directSpecularColor.xyz;
    u_xlat3.xyw = vec3(u_xlat19) * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat3.xyw * u_xlat16_7.xyz + u_xlat16_13.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat38) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_64 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_64 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_64) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_69 + u_xlat16_64;
    u_xlat16_64 = u_xlat16_2.w * u_xlat16_64;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_69;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_64));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat0.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat0.xxx + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_17.y = u_xlat16_15.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlati0 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati57 = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati57].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_64 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_18.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_13.x = dot((-u_xlat16_14.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat5.xyz = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_14.xyz);
    u_xlat4.z = u_xlat16_14.z;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat4.xyz);
    u_xlat57 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat16_13.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_70 = log2(u_xlat0.x);
    u_xlat16_4.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_4.w);
    u_xlat16_32 = u_xlat16_13.x + 1.0;
    u_xlat16_32 = min(u_xlat16_32, 15.0);
    u_xlat16_4.x = u_xlat16_32 * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_4.x = u_xlat16_13.x * 16.0 + u_xlat16_4.z;
    u_xlat16_14.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_62 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_32 = u_xlat16_0.x + (-u_xlat16_62);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_32 + u_xlat16_62;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_13.x;
    u_xlat0.x = u_xlat57 * u_xlat16_69;
    u_xlat16_69 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_69 = u_xlat0.x * u_xlat16_13.x + u_xlat16_69;
    u_xlat16_13.x = u_xlat16_69 + u_xlat16_69;
    u_xlat16_32 = (-u_xlat16_69) * 2.0 + 1.0;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_32 + u_xlat16_13.x;
    u_xlat16_69 = u_xlat0.y * u_xlat16_69;
    u_xlat16_69 = min(u_xlat16_3.z, u_xlat16_69);
    u_xlat0.xyz = u_xlat6.xyz * vec3(u_xlat38) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_68) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_68 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_68;
    u_xlat16_68 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_68);
    u_xlat16_13.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_11.xyz = vec3(u_xlat16_69) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_7.xyz = u_xlat3.xyw * u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat16_7.x = dot(u_xlat16_7.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_1.w * _albedoColor.w + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_1.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat16_45 = cos(u_xlat0.x);
    u_xlat16_45 = max(abs(u_xlat16_45), _emissiveBreathe.z);
    u_xlat16_0 = texture(_emissiveMap, vs_TEXCOORD3.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_0.w>=0.5);
#else
    u_xlatb57 = u_xlat16_0.w>=0.5;
#endif
    u_xlat16_11.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_45 = (u_xlatb57) ? u_xlat16_45 : 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_45) * u_xlat16_11.xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_45 = u_xlat16_70 * _Fresnel2Vector.x;
    u_xlat16_64 = u_xlat16_70 * _FresnelVector.z;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_45 = exp2(u_xlat16_45);
    u_xlat16_68 = max(_Fresnel2Vector.y, 0.0);
    u_xlat16_12.x = u_xlat16_45 * u_xlat16_68;
    u_xlat16_12.xyz = u_xlat16_12.xxx * _Fresnel3Color.xyz;
    u_xlat16_13.xy = max(_FresnelVector.yw, vec2(0.0, 0.0));
    u_xlat16_64 = u_xlat16_64 * u_xlat16_13.y;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _Fresnel2Color.xyz + u_xlat16_12.xyz;
    u_xlat16_0.xy = texture(_FresnelTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.yyy;
    u_xlat16_69 = log2(u_xlat16_0.x);
    u_xlat16_69 = u_xlat16_69 * _FresnelVector.x;
    u_xlat16_69 = exp2(u_xlat16_69);
    u_xlat16_32 = u_xlat16_13.x * u_xlat16_69;
    u_xlat16_64 = u_xlat16_69 * u_xlat16_13.x + u_xlat16_64;
    u_xlat16_45 = u_xlat16_45 * u_xlat16_68 + u_xlat16_64;
    u_xlat16_12.xyz = vec3(u_xlat16_32) * _FresnelColor.xyz + u_xlat16_12.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_7.x = (u_xlatb0) ? u_xlat16_7.x : u_xlat16_26;
    SV_Target0.w = u_xlat16_45 * _Fresnel2Vector.z + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
}
}
 Pass {
 Name "ExtrudeOutline"
  Tags { "RenderType" = "Opaque" }
 Cull Front
  GpuProgramID 72685
Program "vp" {
SubProgram "gles hw_tier00 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OutlineWidth;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_OutlineWidth) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
uniform 	mediump vec4 _OutlineColor;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = _OutlineColor;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OutlineWidth;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_OutlineWidth) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
uniform 	mediump vec4 _OutlineColor;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = _OutlineColor;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
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
uniform 	mediump float _OutlineWidth;
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
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_OutlineWidth) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
uniform 	mediump vec4 _OutlineColor;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = _OutlineColor;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
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
uniform 	mediump float _OutlineWidth;
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
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_OutlineWidth) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
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
uniform 	mediump vec4 _OutlineColor;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = _OutlineColor;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_SMOOTHNORMAL_NONE" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 144257
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
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
in highp vec4 in_POSITION0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
in highp vec4 in_POSITION0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
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
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Fresnel_ExtrudeOutlineGUI"
}