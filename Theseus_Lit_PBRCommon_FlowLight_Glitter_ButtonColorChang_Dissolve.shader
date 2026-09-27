//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_FlowLight_Glitter_ButtonColorChang_Dissolve" {
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

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_MergeTex00 ("合并贴图(01)", 2D) = "white" { }

_MergeTex01 ("合并贴图(02)", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightUpColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightUpFactory ("流光参数", Vector) = (1,1,1,1)

_EnableChangColor ("启用换色", Float) = 0.0

_AlbedoChangTex ("换色后Albedo贴图", 2D) = "white" { }

_AlbedoChangColor ("换色后Albedo颜色", Color) = (1,1,1,1)

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("启用竖向溶解", Float) = 0.0

_DissolveDirSpeed ("溶解方向速度", Vector) = (1,0,0,0)

_DissolveTexScale ("溶解纹理缩放位移", Float) = 0.0

_DissolveEdgeColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveEdgeShrink ("溶解边缘压缩", Float) = 6.0

_DissolveEdgeRange ("溶解边缘范围", Range(0.2, 10)) = 0.0

_Cutoff ("溶解进度", Range(-2, 2)) = 0.0

[Tex] _laserMap ("RGB:镭射渐变图, A:镭射Mask", 2D) = "black" { }

_laserColor ("镭射颜色", Color) = (1,1,1,1)

_laserIntensity ("镭射强度", Float) = 1.0

_MatcapTex ("丝袜高光Matcap", 2D) = "white" { }

_matCapSpeEffectedByLightDir ("丝袜Matcap受灯光方向影响强弱", Range(0, 1)) = 0.20999999344348907

_customMatcapCol ("丝袜伪各项异性高光颜色", Color) = (0.5,0.5,0.5,1)

_customMatcapFresnelStrPow ("丝袜对比度", Float) = 3.0

_customMatcapFresnelStr ("丝袜边缘光强度", Float) = 18.0

_stockingFresnelCol ("丝袜边缘光颜色", Color) = (1,1,1,1)

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_USE_MENDS_LIGHT ("补光开关", Float) = 0.0

_MendsLightDirection ("补光1方向", Vector) = (1,0,1,0)

_MendsLightColor ("补光1颜色", Color) = (1,1,1,1)

_MendsLightFallOff ("补光1衰减", Range(0, 1)) = 0.0

_MendsLightDirection2 ("补光2方向", Vector) = (1,0,1,0)

_MendsLightColor2 ("补光2颜色", Color) = (1,1,1,1)

_MendsLightFallOff2 ("补光2衰减", Range(0, 1)) = 0.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 3741
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
vec2 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_21;
mediump float u_xlat16_23;
vec3 u_xlat24;
float u_xlat26;
int u_xlati26;
mediump float u_xlat16_27;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
vec3 u_xlat31;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_34;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_43;
mediump float u_xlat16_44;
mediump float u_xlat16_47;
float u_xlat51;
float u_xlat52;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
float u_xlat66;
int u_xlati66;
mediump float u_xlat16_67;
float u_xlat68;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_21.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_21.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_21.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_21.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_21.x = u_xlat16_21.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_2.x;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_2.x = u_xlat16_21.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _albedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(_EnableChangColor) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xxx;
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
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat24.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_3.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_63 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_3.xyz = vec3(u_xlat16_63) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat24.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = u_xlat16_3.xx * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_6.xyz = texture(_laserMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_6.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _laserColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_65 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_65;
    u_xlat16_3.x = u_xlat16_3.x * _laserColor.w;
    u_xlat16_2.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_7.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat8.xyz;
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat24.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat65 * u_xlat65;
    u_xlat66 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat66 * u_xlat66;
    u_xlat16_63 = u_xlat66 * u_xlat16_63;
    u_xlat16_63 = u_xlat66 * u_xlat16_63;
    u_xlat8.x = (-u_xlat16_63) * u_xlat66 + 1.0;
    u_xlat16_63 = u_xlat66 * u_xlat16_63;
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xxx;
    u_xlat66 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat66) * vec3(u_xlat16_63) + u_xlat8.xyz;
    u_xlat68 = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat9 = (-u_xlat68) * u_xlat16_63 + u_xlat68;
    u_xlat9 = u_xlat68 * u_xlat9 + u_xlat16_63;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat68 + u_xlat9;
    u_xlat9 = u_xlat9 + 6.10351563e-05;
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat5.xyz;
    u_xlat11 = dot(u_xlat16_10.xyz, u_xlat24.xyz);
    u_xlat12.x = u_xlat11;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_27 = (-u_xlat11) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat11 = max(u_xlat16_27, 0.00100000005);
    u_xlat11 = log2(u_xlat11);
    u_xlat11 = u_xlat11 * _customMatcapFresnelStrPow;
    u_xlat11 = exp2(u_xlat11);
    u_xlat11 = u_xlat11 * _customMatcapFresnelStr;
    u_xlat16_13.xyz = vec3(u_xlat11) * _stockingFresnelCol.zxy;
    u_xlat11 = (-u_xlat12.x) * u_xlat16_63 + u_xlat12.x;
    u_xlat11 = u_xlat12.x * u_xlat11 + u_xlat16_63;
    u_xlat11 = sqrt(u_xlat11);
    u_xlat11 = u_xlat11 + u_xlat12.x;
    u_xlat11 = u_xlat11 + 6.10351563e-05;
    u_xlat31.x = u_xlat9 * u_xlat11;
    u_xlat31.x = float(1.0) / u_xlat31.x;
    u_xlat31.x = min(u_xlat31.x, 16.0);
    u_xlat51 = u_xlat16_63 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat51 + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat16_63 / u_xlat6;
    u_xlat6 = u_xlat6 * 0.318309873;
    u_xlat6 = min(u_xlat6, 16.0);
    u_xlat6 = u_xlat31.x * u_xlat6;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat6);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat8.xyz;
    u_xlat16_27 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_14.xy = vec2(u_xlat16_27) * vs_TEXCOORD5.xy;
    u_xlat16_15.y = u_xlat16_14.y * _matCapSpeEffectedByLightDir;
    u_xlat31.xz = u_xlat24.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat31.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat24.xx + u_xlat31.xz;
    u_xlat31.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat24.zz + u_xlat31.xz;
    u_xlat16_34.xz = u_xlat31.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_14.z = 0.100000001;
    u_xlat16_15.x = _matCapSpeEffectedByLightDir;
    u_xlat16_14.xy = (-u_xlat16_14.xz) * u_xlat16_15.xy + u_xlat16_34.xz;
    u_xlat16_16.xyz = texture(_MatcapTex, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_16.zxy * _customMatcapCol.zxy;
    u_xlat16_14.xyz = vec3(u_xlat68) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat8.xyz) * _MainLightIntensityAndAngleScale.zxy + u_xlat16_13.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_31.xz = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_13.xyz = u_xlat16_31.zzz * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_27 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_27 = max(u_xlat16_27, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_27 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_73 = float(1.0) / float(u_xlat16_27);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_14.xyz = vec3(u_xlat16_27) * u_xlat8.xyz;
    u_xlat16_27 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_15.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27 = max(u_xlat16_27, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_73);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_70;
    u_xlat16_15.xyz = vec3(u_xlat16_27) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + u_xlat16_14.xyz;
    u_xlat6 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat8.xyz = vec3(u_xlat6) * u_xlat8.xyz;
    u_xlat16_27 = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat24.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat51 + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat16_63 / u_xlat6;
    u_xlat6 = u_xlat6 * 0.318309873;
    u_xlat6 = min(u_xlat6, 16.0);
    u_xlat8.x = dot(u_xlat24.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat16_27) + 1.0;
    u_xlat16_27 = u_xlat28.x * u_xlat28.x;
    u_xlat16_27 = u_xlat28.x * u_xlat16_27;
    u_xlat16_27 = u_xlat28.x * u_xlat16_27;
    u_xlat16_70 = u_xlat28.x * u_xlat16_27;
    u_xlat28.x = (-u_xlat16_27) * u_xlat28.x + 1.0;
    u_xlat16.xyz = u_xlat16_3.xyz * u_xlat28.xxx;
    u_xlat16.xyz = vec3(u_xlat66) * vec3(u_xlat16_70) + u_xlat16.xyz;
    u_xlat28.x = (-u_xlat8.x) * u_xlat16_63 + u_xlat8.x;
    u_xlat28.x = u_xlat8.x * u_xlat28.x + u_xlat16_63;
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat8.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat28.x * u_xlat11;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat6 = u_xlat6 * u_xlat28.x;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat6);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat8.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_15.xyz * u_xlat16.xyz;
    u_xlat16_28.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat28.xxx + u_xlat16_13.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_27 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_27 = max(u_xlat16_27, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_27 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_73 = float(1.0) / float(u_xlat16_27);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_14.xyz = vec3(u_xlat16_27) * u_xlat16.xyz;
    u_xlat16_27 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_17.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27 = max(u_xlat16_27, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_73);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_27) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + u_xlat16_14.xyz;
    u_xlat6 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat16.xyz = vec3(u_xlat6) * u_xlat16.xyz;
    u_xlat6 = dot(u_xlat24.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_14.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat24.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat16_62) + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat51 + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat16_63 / u_xlat6;
    u_xlat6 = u_xlat6 * 0.318309873;
    u_xlat6 = min(u_xlat6, 16.0);
    u_xlat51 = (-u_xlat71) * u_xlat16_63 + u_xlat71;
    u_xlat51 = u_xlat71 * u_xlat51 + u_xlat16_63;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat71;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat11 = u_xlat51 * u_xlat11;
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat11 = min(u_xlat11, 16.0);
    u_xlat6 = u_xlat6 * u_xlat11;
    u_xlat16_62 = u_xlat52 * u_xlat52;
    u_xlat16_62 = u_xlat52 * u_xlat16_62;
    u_xlat16_62 = u_xlat52 * u_xlat16_62;
    u_xlat16_27 = u_xlat52 * u_xlat16_62;
    u_xlat11 = (-u_xlat16_62) * u_xlat52 + 1.0;
    u_xlat16.xyz = u_xlat16_3.xyz * vec3(u_xlat11);
    u_xlat16.xyz = vec3(u_xlat66) * vec3(u_xlat16_27) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat6) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_17.xyz * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat28.yyy + u_xlat16_13.xyz;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_62) * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat28.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat68) + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat28.yyy * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat71) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat0.xyz) * u_xlat4.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat24.xyz;
    u_xlat16_62 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz;
    u_xlat16_27 = dot(u_xlat16_17.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_27) + u_xlat16_70;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_27 = u_xlat16_7.w * u_xlat16_70 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_7.w * u_xlat16_27;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_70;
    u_xlat6 = min(u_xlat16_27, 1.0);
    u_xlat26 = min(u_xlat6, u_xlat16_6.z);
    u_xlat16_15.xyz = vec3(u_xlat26) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat26) * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat26) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat26) * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat26) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * vec3(u_xlat26) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_70) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati26 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati66 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_27 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_73 = dot((-u_xlat16_10.xyz), u_xlat24.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat8.xyz = (-u_xlat24.xyz) * vec3(u_xlat16_73) + (-u_xlat16_10.xyz);
    u_xlat24.x = dot(u_xlat16_17.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_17.xyz, u_xlat8.xyz);
    u_xlat16_15.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_47 = floor(u_xlat16_2.w);
    u_xlat16_67 = u_xlat16_47 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_2.x = u_xlat16_67 * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_2.x = u_xlat16_47 * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_47 = u_xlat16_15.z * 15.0 + (-u_xlat16_47);
    u_xlat16_67 = (-u_xlat16_64) + u_xlat16_44;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_67 + u_xlat16_64;
    u_xlat16_47 = u_xlat16_70 * u_xlat16_47;
    u_xlat24.x = u_xlat24.x * u_xlat16_47;
    u_xlat16_47 = u_xlat6 * 0.5;
    u_xlat16_67 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_47 = u_xlat24.x * u_xlat16_67 + u_xlat16_47;
    u_xlat16_67 = u_xlat16_47 + u_xlat16_47;
    u_xlat16_70 = (-u_xlat16_47) * 2.0 + 1.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_70 + u_xlat16_67;
    u_xlat16_47 = u_xlat6 * u_xlat16_47;
    u_xlat16_47 = min(u_xlat16_6.z, u_xlat16_47);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + (-u_xlat8.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_63 = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat12.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_63);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xyw = vec3(u_xlat16_27) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyw = (u_xlatb0.x) ? u_xlat16_7.xyw : u_xlat16_17.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xyw;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat16_3.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_3.yzx * u_xlat16_7.yzx + u_xlat16_13.yzx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat0.xy = u_xlat16_10.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_10.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_10.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_43.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_43.xx;
    u_xlat16_0.x = texture(_MergeTex00, u_xlat0.xy).x;
    u_xlat20.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat20.xy = u_xlat20.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_20.x = texture(_MergeTex00, u_xlat20.xy).x;
    u_xlat16_43.x = u_xlat16_0.x * u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43.x = min(max(u_xlat16_43.x, 0.0), 1.0);
#else
    u_xlat16_43.x = clamp(u_xlat16_43.x, 0.0, 1.0);
#endif
    u_xlat16_43.x = u_xlat16_43.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_43.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_31.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0.x = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_43.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_10.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_43.xy = u_xlat16_43.xy + u_xlat16_10.xy;
    u_xlat16_43.xy = u_xlat16_43.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_43.xy;
    u_xlat16_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _FlowLightUpColor.zxy;
    u_xlat16_43.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_43.xxx * u_xlat16_10.xyz;
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_21.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_23;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
ivec3 u_xlati8;
float u_xlat9;
mediump vec3 u_xlat16_10;
float u_xlat11;
vec2 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_21;
mediump float u_xlat16_23;
vec3 u_xlat24;
float u_xlat26;
int u_xlati26;
mediump float u_xlat16_27;
vec2 u_xlat28;
mediump vec2 u_xlat16_28;
vec3 u_xlat31;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_34;
mediump vec2 u_xlat16_41;
mediump vec2 u_xlat16_43;
mediump float u_xlat16_44;
mediump float u_xlat16_47;
float u_xlat51;
float u_xlat52;
float u_xlat60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
float u_xlat65;
mediump float u_xlat16_65;
float u_xlat66;
int u_xlati66;
mediump float u_xlat16_67;
float u_xlat68;
mediump float u_xlat16_70;
float u_xlat71;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_21.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_21.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_21.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_21.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_21.x = u_xlat16_21.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_2.x;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_2.x = u_xlat16_21.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _albedoColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.zxy + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(_EnableChangColor) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_62 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_62) + vs_TEXCOORD2.yzx;
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xxx;
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
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat24.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_3.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_63 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_3.xyz = vec3(u_xlat16_63) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat24.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = u_xlat16_3.xx * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_6.xyz = texture(_laserMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_6.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _laserColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_65 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_65;
    u_xlat16_3.x = u_xlat16_3.x * _laserColor.w;
    u_xlat16_2.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_7.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat65 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat8.xyz = vec3(u_xlat65) * u_xlat8.xyz;
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat65 = dot(u_xlat24.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat65 * u_xlat65;
    u_xlat66 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat66 * u_xlat66;
    u_xlat16_63 = u_xlat66 * u_xlat16_63;
    u_xlat16_63 = u_xlat66 * u_xlat16_63;
    u_xlat8.x = (-u_xlat16_63) * u_xlat66 + 1.0;
    u_xlat16_63 = u_xlat66 * u_xlat16_63;
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xxx;
    u_xlat66 = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat66) * vec3(u_xlat16_63) + u_xlat8.xyz;
    u_xlat68 = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat9 = (-u_xlat68) * u_xlat16_63 + u_xlat68;
    u_xlat9 = u_xlat68 * u_xlat9 + u_xlat16_63;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat68 + u_xlat9;
    u_xlat9 = u_xlat9 + 6.10351563e-05;
    u_xlat16_10.xyz = vec3(u_xlat16_62) * u_xlat5.xyz;
    u_xlat11 = dot(u_xlat16_10.xyz, u_xlat24.xyz);
    u_xlat12.x = u_xlat11;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_27 = (-u_xlat11) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat11 = max(u_xlat16_27, 0.00100000005);
    u_xlat11 = log2(u_xlat11);
    u_xlat11 = u_xlat11 * _customMatcapFresnelStrPow;
    u_xlat11 = exp2(u_xlat11);
    u_xlat11 = u_xlat11 * _customMatcapFresnelStr;
    u_xlat16_13.xyz = vec3(u_xlat11) * _stockingFresnelCol.zxy;
    u_xlat11 = (-u_xlat12.x) * u_xlat16_63 + u_xlat12.x;
    u_xlat11 = u_xlat12.x * u_xlat11 + u_xlat16_63;
    u_xlat11 = sqrt(u_xlat11);
    u_xlat11 = u_xlat11 + u_xlat12.x;
    u_xlat11 = u_xlat11 + 6.10351563e-05;
    u_xlat31.x = u_xlat9 * u_xlat11;
    u_xlat31.x = float(1.0) / u_xlat31.x;
    u_xlat31.x = min(u_xlat31.x, 16.0);
    u_xlat51 = u_xlat16_63 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat51 + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat16_63 / u_xlat6;
    u_xlat6 = u_xlat6 * 0.318309873;
    u_xlat6 = min(u_xlat6, 16.0);
    u_xlat6 = u_xlat31.x * u_xlat6;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat6);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = vec3(u_xlat68) * u_xlat8.xyz;
    u_xlat16_27 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_14.xy = vec2(u_xlat16_27) * vs_TEXCOORD5.xy;
    u_xlat16_15.y = u_xlat16_14.y * _matCapSpeEffectedByLightDir;
    u_xlat31.xz = u_xlat24.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat31.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat24.xx + u_xlat31.xz;
    u_xlat31.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat24.zz + u_xlat31.xz;
    u_xlat16_34.xz = u_xlat31.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_14.z = 0.100000001;
    u_xlat16_15.x = _matCapSpeEffectedByLightDir;
    u_xlat16_14.xy = (-u_xlat16_14.xz) * u_xlat16_15.xy + u_xlat16_34.xz;
    u_xlat16_16.xyz = texture(_MatcapTex, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_16.zxy * _customMatcapCol.zxy;
    u_xlat16_14.xyz = vec3(u_xlat68) * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_13.xyz;
    u_xlat16_13.xyz = (-u_xlat8.xyz) * _MainLightIntensityAndAngleScale.zxy + u_xlat16_13.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_31.xz = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_13.xyz = u_xlat16_31.zzz * u_xlat16_13.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_27 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_27 = max(u_xlat16_27, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_27 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_73 = float(1.0) / float(u_xlat16_27);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_14.xyz = vec3(u_xlat16_27) * u_xlat8.xyz;
    u_xlat16_27 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_15.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27 = max(u_xlat16_27, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_73 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_73);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_70;
    u_xlat16_15.xyz = vec3(u_xlat16_27) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + u_xlat16_14.xyz;
    u_xlat6 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat8.xyz = vec3(u_xlat6) * u_xlat8.xyz;
    u_xlat16_27 = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat6 = dot(u_xlat24.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat51 + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat16_63 / u_xlat6;
    u_xlat6 = u_xlat6 * 0.318309873;
    u_xlat6 = min(u_xlat6, 16.0);
    u_xlat8.x = dot(u_xlat24.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat28.x = (-u_xlat16_27) + 1.0;
    u_xlat16_27 = u_xlat28.x * u_xlat28.x;
    u_xlat16_27 = u_xlat28.x * u_xlat16_27;
    u_xlat16_27 = u_xlat28.x * u_xlat16_27;
    u_xlat16_70 = u_xlat28.x * u_xlat16_27;
    u_xlat28.x = (-u_xlat16_27) * u_xlat28.x + 1.0;
    u_xlat16.xyz = u_xlat16_3.xyz * u_xlat28.xxx;
    u_xlat16.xyz = vec3(u_xlat66) * vec3(u_xlat16_70) + u_xlat16.xyz;
    u_xlat28.x = (-u_xlat8.x) * u_xlat16_63 + u_xlat8.x;
    u_xlat28.x = u_xlat8.x * u_xlat28.x + u_xlat16_63;
    u_xlat28.x = sqrt(u_xlat28.x);
    u_xlat28.x = u_xlat28.x + u_xlat8.x;
    u_xlat28.x = u_xlat28.x + 6.10351563e-05;
    u_xlat28.x = u_xlat28.x * u_xlat11;
    u_xlat28.x = float(1.0) / u_xlat28.x;
    u_xlat28.x = min(u_xlat28.x, 16.0);
    u_xlat6 = u_xlat6 * u_xlat28.x;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat6);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = u_xlat8.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_15.xyz * u_xlat16.xyz;
    u_xlat16_28.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat28.xy = u_xlat16_28.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat28.xy = min(max(u_xlat28.xy, 0.0), 1.0);
#else
    u_xlat28.xy = clamp(u_xlat28.xy, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat28.xxx + u_xlat16_13.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_27 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_27 = max(u_xlat16_27, 6.10351563e-05);
    u_xlat16_70 = u_xlat16_27 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_73 = float(1.0) / float(u_xlat16_27);
    u_xlat16_27 = inversesqrt(u_xlat16_27);
    u_xlat16_14.xyz = vec3(u_xlat16_27) * u_xlat16.xyz;
    u_xlat16_27 = u_xlat16_70 * u_xlat16_73;
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_17.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27 = max(u_xlat16_27, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_73);
    u_xlat16_27 = u_xlat16_27 * u_xlat16_70;
    u_xlat16_17.xyz = vec3(u_xlat16_27) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16.xyz = u_xlat5.xyz * vec3(u_xlat16_62) + u_xlat16_14.xyz;
    u_xlat6 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat16.xyz = vec3(u_xlat6) * u_xlat16.xyz;
    u_xlat6 = dot(u_xlat24.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat16_62 = dot(u_xlat16_14.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat71 = dot(u_xlat24.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat52 = (-u_xlat16_62) + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat51 + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat16_63 / u_xlat6;
    u_xlat6 = u_xlat6 * 0.318309873;
    u_xlat6 = min(u_xlat6, 16.0);
    u_xlat51 = (-u_xlat71) * u_xlat16_63 + u_xlat71;
    u_xlat51 = u_xlat71 * u_xlat51 + u_xlat16_63;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat71;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat11 = u_xlat51 * u_xlat11;
    u_xlat11 = float(1.0) / u_xlat11;
    u_xlat11 = min(u_xlat11, 16.0);
    u_xlat6 = u_xlat6 * u_xlat11;
    u_xlat16_62 = u_xlat52 * u_xlat52;
    u_xlat16_62 = u_xlat52 * u_xlat16_62;
    u_xlat16_62 = u_xlat52 * u_xlat16_62;
    u_xlat16_27 = u_xlat52 * u_xlat16_62;
    u_xlat11 = (-u_xlat16_62) * u_xlat52 + 1.0;
    u_xlat16.xyz = u_xlat16_3.xyz * vec3(u_xlat11);
    u_xlat16.xyz = vec3(u_xlat66) * vec3(u_xlat16_27) + u_xlat16.xyz;
    u_xlat16.xyz = vec3(u_xlat6) * u_xlat16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.zxy;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_17.xyz * u_xlat16.xyz;
    u_xlat16_13.xyz = u_xlat16.xyz * u_xlat28.yyy + u_xlat16_13.xyz;
    u_xlat16_62 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_62) * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat28.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat68) + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat28.yyy * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(u_xlat71) + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = (-u_xlat0.xyz) * u_xlat4.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat24.xyz;
    u_xlat16_62 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat16_17.xyz = vec3(u_xlat16_62) * u_xlat16_17.xyz;
    u_xlat16_27 = dot(u_xlat16_17.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_27 = min(max(u_xlat16_27, 0.0), 1.0);
#else
    u_xlat16_27 = clamp(u_xlat16_27, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_27 * 0.5 + 0.5;
    u_xlat16_70 = (-u_xlat16_27) + u_xlat16_70;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_27 = u_xlat16_7.w * u_xlat16_70 + u_xlat16_27;
    u_xlat16_27 = u_xlat16_7.w * u_xlat16_27;
    u_xlat16_70 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 + -1.0;
    u_xlat16_70 = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_27 = u_xlat16_27 * u_xlat16_70;
    u_xlat6 = min(u_xlat16_27, 1.0);
    u_xlat26 = min(u_xlat6, u_xlat16_6.z);
    u_xlat16_15.xyz = vec3(u_xlat26) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat26) * u_xlat16_15.xyz;
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = vec3(u_xlat26) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat26) * u_xlat16_18.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat26) + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_18.xyz * vec3(u_xlat26) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_18.y = u_xlat16_17.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_70) * u_xlat16_19.xyz;
    u_xlati26 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati26].xyz;
    u_xlati26 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati66 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati26].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati66].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_27 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_2.xyz * u_xlat16_19.xyz;
    u_xlat16_14.xyz = u_xlat16_18.xyz * u_xlat16_15.xyz + u_xlat16_14.xyz;
    u_xlat16_73 = dot((-u_xlat16_10.xyz), u_xlat24.xyz);
    u_xlat16_73 = u_xlat16_73 + u_xlat16_73;
    u_xlat8.xyz = (-u_xlat24.xyz) * vec3(u_xlat16_73) + (-u_xlat16_10.xyz);
    u_xlat24.x = dot(u_xlat16_17.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_17.xyz, u_xlat8.xyz);
    u_xlat16_15.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_15.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_47 = floor(u_xlat16_2.w);
    u_xlat16_67 = u_xlat16_47 + 1.0;
    u_xlat16_67 = min(u_xlat16_67, 15.0);
    u_xlat16_2.x = u_xlat16_67 * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_2.x = u_xlat16_47 * 16.0 + u_xlat16_2.z;
    u_xlat16_15.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_15.xy = u_xlat16_15.xy * vec2(0.00390625, 0.0625);
    u_xlat16_64 = texture(_SpecularOcclusionLut3D, u_xlat16_15.xy).x;
    u_xlat16_47 = u_xlat16_15.z * 15.0 + (-u_xlat16_47);
    u_xlat16_67 = (-u_xlat16_64) + u_xlat16_44;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_67 + u_xlat16_64;
    u_xlat16_47 = u_xlat16_70 * u_xlat16_47;
    u_xlat24.x = u_xlat24.x * u_xlat16_47;
    u_xlat16_47 = u_xlat6 * 0.5;
    u_xlat16_67 = (-u_xlat6) * 0.5 + 1.0;
    u_xlat16_47 = u_xlat24.x * u_xlat16_67 + u_xlat16_47;
    u_xlat16_67 = u_xlat16_47 + u_xlat16_47;
    u_xlat16_70 = (-u_xlat16_47) * 2.0 + 1.0;
    u_xlat16_47 = u_xlat16_47 * u_xlat16_70 + u_xlat16_67;
    u_xlat16_47 = u_xlat6 * u_xlat16_47;
    u_xlat16_47 = min(u_xlat16_6.z, u_xlat16_47);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + (-u_xlat8.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat16_15.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_15.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat15.y = u_xlat0.y;
    u_xlat15.xz = u_xlat16_15.xz;
    u_xlat16_63 = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat12.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat15.xyz, u_xlat16_63);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_7.xyw = vec3(u_xlat16_27) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyw = (u_xlatb0.x) ? u_xlat16_7.xyw : u_xlat16_17.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xyw;
    u_xlat16_3.xyz = vec3(u_xlat16_47) * u_xlat16_3.xyz;
    u_xlat16_7.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xyz = min(max(u_xlat16_7.xyz, 0.0), 1.0);
#else
    u_xlat16_7.xyz = clamp(u_xlat16_7.xyz, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyz = u_xlat16_3.yzx * u_xlat16_7.yzx + u_xlat16_13.yzx;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_23 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_13.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat0.xy = u_xlat16_10.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_10.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_10.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_43.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_43.xx;
    u_xlat16_0.x = texture(_MergeTex00, u_xlat0.xy).x;
    u_xlat20.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat20.xy = u_xlat20.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_20.x = texture(_MergeTex00, u_xlat20.xy).x;
    u_xlat16_43.x = u_xlat16_0.x * u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_43.x = min(max(u_xlat16_43.x, 0.0), 1.0);
#else
    u_xlat16_43.x = clamp(u_xlat16_43.x, 0.0, 1.0);
#endif
    u_xlat16_43.x = u_xlat16_43.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_43.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_31.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0.x = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_43.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_10.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_43.xy = u_xlat16_43.xy + u_xlat16_10.xy;
    u_xlat16_43.xy = u_xlat16_43.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_43.xy;
    u_xlat16_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * _FlowLightUpColor.zxy;
    u_xlat16_43.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_43.xxx * u_xlat16_10.xyz;
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_21.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_23;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(14) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(16) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat25;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat44;
mediump float u_xlat16_44;
bool u_xlatb44;
float u_xlat60;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_67;
float u_xlat68;
float u_xlat70;
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
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_21.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_21.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_21.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_21.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_21.x = u_xlat16_21.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_2.x;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_2.x = u_xlat16_21.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat8.xyz = vec3(u_xlat66) * u_xlat16_7.xyz;
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
    u_xlat66 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat8.xyz = vec3(u_xlat66) * u_xlat6.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat23.x = max((-u_xlat0.w), u_xlat3.x);
    u_xlat23.x = (-u_xlat3.x) + u_xlat23.x;
    u_xlat0.z = _ShadowBias.y * u_xlat23.x + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat20.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_20.z * _shadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.99000001);
#else
    u_xlatb0.x = u_xlat0.x>=0.99000001;
#endif
    u_xlat16_7.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat0.x = max(u_xlat60, 0.0);
    u_xlat16_27.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_11.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD5.xy;
    u_xlat16_12.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_12.x = _matCapSpeEffectedByLightDir;
    u_xlat3.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat3.xy;
    u_xlat16_31.xz = u_xlat3.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_12.xy + u_xlat16_31.xz;
    u_xlat16_3.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_3.zxy * _customMatcapCol.zxy;
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    u_xlat3.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat3.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_7.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_12.xyz = u_xlat23.xyz * u_xlat16_7.xxx;
    u_xlat4.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
    u_xlat16_71 = (-u_xlat4.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat44 = max(u_xlat16_71, 0.00100000005);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * _customMatcapFresnelStrPow;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * _customMatcapFresnelStr;
    u_xlat16_13.xyz = vec3(u_xlat44) * _stockingFresnelCol.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_27.xyz + u_xlat16_13.xyz;
    u_xlat16_5.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_5.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_5.zxy * u_xlat16_13.xyz;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_2.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_2.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _albedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat23.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_71 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_14.xyz = vec3(u_xlat16_71) * u_xlat16_14.xyz;
    u_xlat16_71 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_71) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_5.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_5.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_5.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) + u_xlat16_14.xyz;
    u_xlat16_71 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_44 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_44;
    u_xlat16_71 = u_xlat16_71 * _laserColor.w;
    u_xlat16_13.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = u_xlat23.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat64 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat64 * u_xlat64;
    u_xlat16_71 = u_xlat64 * u_xlat16_71;
    u_xlat16_71 = u_xlat64 * u_xlat16_71;
    u_xlat5.x = (-u_xlat16_71) * u_xlat64 + 1.0;
    u_xlat16_71 = u_xlat64 * u_xlat16_71;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat5.xxx;
    u_xlat64 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat64) * vec3(u_xlat16_71) + u_xlat10.xyz;
    u_xlat16_71 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat5.x = (-u_xlat3.x) * u_xlat16_71 + u_xlat3.x;
    u_xlat5.x = u_xlat3.x * u_xlat5.x + u_xlat16_71;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat3.x + u_xlat5.x;
    u_xlat65 = (-u_xlat4.x) * u_xlat16_71 + u_xlat4.x;
    u_xlat65 = u_xlat4.x * u_xlat65 + u_xlat16_71;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat5.w = u_xlat4.x + u_xlat65;
    u_xlat5.xw = u_xlat5.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.w;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat68 = u_xlat16_71 + -1.0;
    u_xlat44 = u_xlat44 * u_xlat68 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_71 / u_xlat44;
    u_xlat44 = u_xlat44 * 0.318309873;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat44 = u_xlat5.x * u_xlat44;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = (-u_xlat10.xyz) * u_xlat16_27.xyz + u_xlat16_11.xyz;
    u_xlat10.xyz = u_xlat16_27.xyz * u_xlat10.xyz;
    u_xlat16_16.xy = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_11.xyz = u_xlat16_16.yyy * u_xlat16_11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb44 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_17.xy = (bool(u_xlatb44)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb44 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_74 = (u_xlatb44) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_17.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat10.xyz = u_xlat23.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
    u_xlat16_72 = dot(u_xlat16_15.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat68 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_71 / u_xlat44;
    u_xlat44 = u_xlat44 * 0.318309873;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat10.x * u_xlat10.x;
    u_xlat16_72 = u_xlat10.x * u_xlat16_72;
    u_xlat16_72 = u_xlat10.x * u_xlat16_72;
    u_xlat16_73 = u_xlat10.x * u_xlat16_72;
    u_xlat10.x = (-u_xlat16_72) * u_xlat10.x + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat10.xxx;
    u_xlat10.xyz = vec3(u_xlat64) * vec3(u_xlat16_73) + u_xlat10.xyz;
    u_xlat70 = (-u_xlat5.x) * u_xlat16_71 + u_xlat5.x;
    u_xlat70 = u_xlat5.x * u_xlat70 + u_xlat16_71;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat5.x + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat70 = u_xlat5.w * u_xlat70;
    u_xlat70 = float(1.0) / u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat44 = u_xlat44 * u_xlat70;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_17.xyz * u_xlat10.xyz;
    u_xlat16_11.xyz = u_xlat10.xyz * u_xlat20.xxx + u_xlat16_11.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb44 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb44)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb44 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb44) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat44 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat44);
    u_xlat44 = dot(u_xlat8.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_7.x = dot(u_xlat16_15.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat16_7.x) + 1.0;
    u_xlat63 = u_xlat44 * u_xlat44;
    u_xlat63 = u_xlat63 * u_xlat68 + 1.0;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat16_71 / u_xlat63;
    u_xlat63 = u_xlat63 * 0.318309873;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat44 = (-u_xlat23.x) * u_xlat16_71 + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_71;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat23.x + u_xlat44;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat5.w;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat63 = u_xlat63 * u_xlat44;
    u_xlat16_7.x = u_xlat43 * u_xlat43;
    u_xlat16_7.x = u_xlat43 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat43 * u_xlat16_7.x;
    u_xlat16_72 = u_xlat43 * u_xlat16_7.x;
    u_xlat43 = (-u_xlat16_7.x) * u_xlat43 + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * vec3(u_xlat43);
    u_xlat10.xyz = vec3(u_xlat64) * vec3(u_xlat16_72) + u_xlat10.xyz;
    u_xlat10.xyz = vec3(u_xlat63) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat23.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_18.xyz * u_xlat10.xyz;
    u_xlat16_11.xyz = u_xlat10.xyz * u_xlat20.yyy + u_xlat16_11.xyz;
    u_xlat16_7.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_27.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat20.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat5.xxx * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat3.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat20.yyy * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_15.xyz * u_xlat23.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat66) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_67) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_67 = u_xlat16_9.w * u_xlat16_72 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_9.w * u_xlat16_67;
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
    u_xlat0.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_12.xyz);
    u_xlat3.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_15.xyz, u_xlat0.xzw);
    u_xlat16_13.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_8.w);
    u_xlat16_33.x = u_xlat16_13.x + 1.0;
    u_xlat16_33.x = min(u_xlat16_33.x, 15.0);
    u_xlat16_8.x = u_xlat16_33.x * 16.0 + u_xlat16_8.z;
    u_xlat16_33.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_8.x = u_xlat16_13.x * 16.0 + u_xlat16_8.z;
    u_xlat16_33.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_33.x = (-u_xlat16_43) + u_xlat16_23;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_33.x + u_xlat16_43;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_13.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_72;
    u_xlat16_72 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_72 = u_xlat3.x * u_xlat16_13.x + u_xlat16_72;
    u_xlat16_13.x = u_xlat16_72 + u_xlat16_72;
    u_xlat16_33.x = (-u_xlat16_72) * 2.0 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_33.x + u_xlat16_13.x;
    u_xlat16_72 = u_xlat0.y * u_xlat16_72;
    u_xlat16_72 = min(u_xlat16_5.z, u_xlat16_72);
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat66) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_71) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_71 = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat4.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_71);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_14.yzx * u_xlat16_15.yzx + u_xlat16_11.yzx;
    u_xlat16_67 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_2.w * _albedoColor.w + u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_2.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat0.xy = u_xlat16_12.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_12.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_12.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat3.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_31.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_31.xx;
    u_xlat16_0.x = texture(_MergeTex00, u_xlat0.xy).x;
    u_xlat20.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat20.xy = u_xlat20.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_20.x = texture(_MergeTex00, u_xlat20.xy).x;
    u_xlat16_31.x = u_xlat16_0.x * u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.x = min(max(u_xlat16_31.x, 0.0), 1.0);
#else
    u_xlat16_31.x = clamp(u_xlat16_31.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_31.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_31.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_16.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0.x = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_31.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_12.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_31.xy = u_xlat16_31.xy + u_xlat16_12.xy;
    u_xlat16_31.xy = u_xlat16_31.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_31.xy;
    u_xlat16_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.zxy * _FlowLightUpColor.zxy;
    u_xlat16_12.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_12.xxx;
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_21.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_67 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(14) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(16) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_21;
vec3 u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat25;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat44;
mediump float u_xlat16_44;
bool u_xlatb44;
float u_xlat60;
float u_xlat63;
float u_xlat64;
float u_xlat65;
float u_xlat66;
mediump float u_xlat16_67;
float u_xlat68;
float u_xlat70;
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
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_21.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_21.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_21.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_21.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_21.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_21.x = u_xlat16_21.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21.x = min(max(u_xlat16_21.x, 0.0), 1.0);
#else
    u_xlat16_21.x = clamp(u_xlat16_21.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_21.x * -2.0 + 3.0;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_21.x;
    u_xlat16_21.x = u_xlat16_21.x * u_xlat16_2.x;
    u_xlat16_21.x = min(u_xlat16_21.x, 1.0);
    u_xlat16_2.x = u_xlat16_21.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat25.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat25.xyz, u_xlat25.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat66 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat8.xyz = vec3(u_xlat66) * u_xlat16_7.xyz;
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
    u_xlat66 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat8.xyz = vec3(u_xlat66) * u_xlat6.xyz;
    u_xlat25.x = dot(u_xlat8.xyz, u_xlat25.xyz);
    u_xlat25.x = (-u_xlat25.x) * u_xlat25.x + 1.0;
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * _ShadowBias.z;
    u_xlat25.xyz = (-u_xlat8.xyz) * u_xlat25.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat25.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat23.x = max((-u_xlat0.w), u_xlat3.x);
    u_xlat23.x = (-u_xlat3.x) + u_xlat23.x;
    u_xlat0.z = _ShadowBias.y * u_xlat23.x + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat20.x = (-u_xlat16_7.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_7.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_20.z * _shadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat0.x) * u_xlat16_7.x + 1.0;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.99000001);
#else
    u_xlatb0.x = u_xlat0.x>=0.99000001;
#endif
    u_xlat16_7.x = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat0.x = max(u_xlat60, 0.0);
    u_xlat16_27.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = u_xlat0.xxx * u_xlat16_27.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_11.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD5.xy;
    u_xlat16_12.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_12.x = _matCapSpeEffectedByLightDir;
    u_xlat3.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat3.xy;
    u_xlat16_31.xz = u_xlat3.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_12.xy + u_xlat16_31.xz;
    u_xlat16_3.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_3.zxy * _customMatcapCol.zxy;
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    u_xlat3.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat3.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_7.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_12.xyz = u_xlat23.xyz * u_xlat16_7.xxx;
    u_xlat4.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
    u_xlat16_71 = (-u_xlat4.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat44 = max(u_xlat16_71, 0.00100000005);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * _customMatcapFresnelStrPow;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * _customMatcapFresnelStr;
    u_xlat16_13.xyz = vec3(u_xlat44) * _stockingFresnelCol.zxy;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_27.xyz + u_xlat16_13.xyz;
    u_xlat16_5.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_5.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_5.zxy * u_xlat16_13.xyz;
    u_xlat16_2 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_2.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_2.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _albedoColor.zxy;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.zxy + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat23.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_71 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_14.xyz = vec3(u_xlat16_71) * u_xlat16_14.xyz;
    u_xlat16_71 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_71) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_5.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_5.zxy * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_5.zxy * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.zxy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) + u_xlat16_14.xyz;
    u_xlat16_71 = dot(u_xlat16_14.yzx, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_44 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_71 = u_xlat16_71 * u_xlat16_44;
    u_xlat16_71 = u_xlat16_71 * _laserColor.w;
    u_xlat16_13.xyz = vec3(u_xlat16_71) * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_5.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_9.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat10.xyz = u_xlat23.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat64 = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat64 * u_xlat64;
    u_xlat16_71 = u_xlat64 * u_xlat16_71;
    u_xlat16_71 = u_xlat64 * u_xlat16_71;
    u_xlat5.x = (-u_xlat16_71) * u_xlat64 + 1.0;
    u_xlat16_71 = u_xlat64 * u_xlat16_71;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat5.xxx;
    u_xlat64 = u_xlat16_14.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat10.xyz = vec3(u_xlat64) * vec3(u_xlat16_71) + u_xlat10.xyz;
    u_xlat16_71 = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_71;
    u_xlat16_71 = max(u_xlat16_71, 0.0078125);
    u_xlat5.x = (-u_xlat3.x) * u_xlat16_71 + u_xlat3.x;
    u_xlat5.x = u_xlat3.x * u_xlat5.x + u_xlat16_71;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat3.x + u_xlat5.x;
    u_xlat65 = (-u_xlat4.x) * u_xlat16_71 + u_xlat4.x;
    u_xlat65 = u_xlat4.x * u_xlat65 + u_xlat16_71;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat5.w = u_xlat4.x + u_xlat65;
    u_xlat5.xw = u_xlat5.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.x * u_xlat5.w;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat68 = u_xlat16_71 + -1.0;
    u_xlat44 = u_xlat44 * u_xlat68 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_71 / u_xlat44;
    u_xlat44 = u_xlat44 * 0.318309873;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat44 = u_xlat5.x * u_xlat44;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat3.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_11.xyz = (-u_xlat10.xyz) * u_xlat16_27.xyz + u_xlat16_11.xyz;
    u_xlat10.xyz = u_xlat16_27.xyz * u_xlat10.xyz;
    u_xlat16_16.xy = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_11.xyz = u_xlat16_16.yyy * u_xlat16_11.xyz + u_xlat10.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_72 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb44 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_17.xy = (bool(u_xlatb44)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb44 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_74 = (u_xlatb44) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_17.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat10.xyz = u_xlat23.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
    u_xlat16_72 = dot(u_xlat16_15.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat44 = dot(u_xlat8.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat44 * u_xlat68 + 1.0;
    u_xlat44 = u_xlat44 * u_xlat44;
    u_xlat44 = u_xlat16_71 / u_xlat44;
    u_xlat44 = u_xlat44 * 0.318309873;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat10.x = (-u_xlat16_72) + 1.0;
    u_xlat16_72 = u_xlat10.x * u_xlat10.x;
    u_xlat16_72 = u_xlat10.x * u_xlat16_72;
    u_xlat16_72 = u_xlat10.x * u_xlat16_72;
    u_xlat16_73 = u_xlat10.x * u_xlat16_72;
    u_xlat10.x = (-u_xlat16_72) * u_xlat10.x + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * u_xlat10.xxx;
    u_xlat10.xyz = vec3(u_xlat64) * vec3(u_xlat16_73) + u_xlat10.xyz;
    u_xlat70 = (-u_xlat5.x) * u_xlat16_71 + u_xlat5.x;
    u_xlat70 = u_xlat5.x * u_xlat70 + u_xlat16_71;
    u_xlat70 = sqrt(u_xlat70);
    u_xlat70 = u_xlat5.x + u_xlat70;
    u_xlat70 = u_xlat70 + 6.10351563e-05;
    u_xlat70 = u_xlat5.w * u_xlat70;
    u_xlat70 = float(1.0) / u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat44 = u_xlat44 * u_xlat70;
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_17.xyz * u_xlat10.xyz;
    u_xlat16_11.xyz = u_xlat10.xyz * u_xlat20.xxx + u_xlat16_11.xyz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_72 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_72 = max(u_xlat16_72, 6.10351563e-05);
    u_xlat16_73 = u_xlat16_72 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_73 = (-u_xlat16_73) * u_xlat16_73 + 1.0;
    u_xlat16_73 = max(u_xlat16_73, 0.0);
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
    u_xlat16_74 = float(1.0) / float(u_xlat16_72);
    u_xlat16_72 = inversesqrt(u_xlat16_72);
    u_xlat16_15.xyz = u_xlat10.xyz * vec3(u_xlat16_72);
    u_xlat16_72 = u_xlat16_73 * u_xlat16_74;
    u_xlat16_73 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.00100000005>=abs(u_xlat16_73));
#else
    u_xlatb44 = 0.00100000005>=abs(u_xlat16_73);
#endif
    u_xlat16_18.xy = (bool(u_xlatb44)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_73 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_73 = u_xlat16_73 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_73 = min(max(u_xlat16_73, 0.0), 1.0);
#else
    u_xlat16_73 = clamp(u_xlat16_73, 0.0, 1.0);
#endif
    u_xlat16_73 = u_xlat16_73 * u_xlat16_73;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb44 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_74 = (u_xlatb44) ? 1.0 : 0.0;
    u_xlat16_73 = max(u_xlat16_73, u_xlat16_74);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_18.xyz = vec3(u_xlat16_72) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat44 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat44 = inversesqrt(u_xlat44);
    u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat44);
    u_xlat44 = dot(u_xlat8.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat44 = min(max(u_xlat44, 0.0), 1.0);
#else
    u_xlat44 = clamp(u_xlat44, 0.0, 1.0);
#endif
    u_xlat16_7.x = dot(u_xlat16_15.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat16_7.x) + 1.0;
    u_xlat63 = u_xlat44 * u_xlat44;
    u_xlat63 = u_xlat63 * u_xlat68 + 1.0;
    u_xlat63 = u_xlat63 * u_xlat63;
    u_xlat63 = u_xlat16_71 / u_xlat63;
    u_xlat63 = u_xlat63 * 0.318309873;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat44 = (-u_xlat23.x) * u_xlat16_71 + u_xlat23.x;
    u_xlat44 = u_xlat23.x * u_xlat44 + u_xlat16_71;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat23.x + u_xlat44;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat44 * u_xlat5.w;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat63 = u_xlat63 * u_xlat44;
    u_xlat16_7.x = u_xlat43 * u_xlat43;
    u_xlat16_7.x = u_xlat43 * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat43 * u_xlat16_7.x;
    u_xlat16_72 = u_xlat43 * u_xlat16_7.x;
    u_xlat43 = (-u_xlat16_7.x) * u_xlat43 + 1.0;
    u_xlat10.xyz = u_xlat16_14.xyz * vec3(u_xlat43);
    u_xlat10.xyz = vec3(u_xlat64) * vec3(u_xlat16_72) + u_xlat10.xyz;
    u_xlat10.xyz = vec3(u_xlat63) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.zxy;
    u_xlat10.xyz = u_xlat23.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat16_18.xyz * u_xlat10.xyz;
    u_xlat16_11.xyz = u_xlat10.xyz * u_xlat20.yyy + u_xlat16_11.xyz;
    u_xlat16_7.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_27.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat20.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat5.xxx * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat3.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat20.yyy * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_15.xyz * u_xlat23.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat66) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_67 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
    u_xlat16_67 = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_67 * 0.5 + 0.5;
    u_xlat16_72 = (-u_xlat16_67) + u_xlat16_72;
    u_xlat16_73 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_9.w = _occlusionScale * u_xlat16_73 + 1.0;
    u_xlat16_67 = u_xlat16_9.w * u_xlat16_72 + u_xlat16_67;
    u_xlat16_67 = u_xlat16_9.w * u_xlat16_67;
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
    u_xlat0.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_17.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_18.y = u_xlat16_15.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_72) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_19.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat0.xzw = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_12.xyz);
    u_xlat3.x = dot(u_xlat16_15.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_9.z = dot(u_xlat16_15.xyz, u_xlat0.xzw);
    u_xlat16_13.xyz = u_xlat16_9.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_8.w);
    u_xlat16_33.x = u_xlat16_13.x + 1.0;
    u_xlat16_33.x = min(u_xlat16_33.x, 15.0);
    u_xlat16_8.x = u_xlat16_33.x * 16.0 + u_xlat16_8.z;
    u_xlat16_33.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_8.x = u_xlat16_13.x * 16.0 + u_xlat16_8.z;
    u_xlat16_33.xz = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_33.xz = u_xlat16_33.xz * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_33.x = (-u_xlat16_43) + u_xlat16_23;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_33.x + u_xlat16_43;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_13.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_72;
    u_xlat16_72 = u_xlat0.y * 0.5;
    u_xlat16_13.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_72 = u_xlat3.x * u_xlat16_13.x + u_xlat16_72;
    u_xlat16_13.x = u_xlat16_72 + u_xlat16_72;
    u_xlat16_33.x = (-u_xlat16_72) * 2.0 + 1.0;
    u_xlat16_72 = u_xlat16_72 * u_xlat16_33.x + u_xlat16_13.x;
    u_xlat16_72 = u_xlat0.y * u_xlat16_72;
    u_xlat16_72 = min(u_xlat16_5.z, u_xlat16_72);
    u_xlat3.xyz = u_xlat6.xyz * vec3(u_xlat66) + (-u_xlat0.xzw);
    u_xlat0.xyz = vec3(u_xlat16_71) * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_71 = u_xlat16_9.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_9.x);
    u_xlat4.y = u_xlat16_9.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_71);
    u_xlat16_15.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_72) * u_xlat16_14.xyz;
    u_xlat16_15.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xyz = min(max(u_xlat16_15.xyz, 0.0), 1.0);
#else
    u_xlat16_15.xyz = clamp(u_xlat16_15.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_14.yzx * u_xlat16_15.yzx + u_xlat16_11.yzx;
    u_xlat16_67 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_2.w * _albedoColor.w + u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_2.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.zxy * _emissiveColor.zxy;
    u_xlat16_14.xyz = u_xlat16_31.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat0.xy = u_xlat16_12.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_12.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_12.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat3.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_31.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_31.xx;
    u_xlat16_0.x = texture(_MergeTex00, u_xlat0.xy).x;
    u_xlat20.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat20.xy = u_xlat20.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_20.x = texture(_MergeTex00, u_xlat20.xy).x;
    u_xlat16_31.x = u_xlat16_0.x * u_xlat16_20.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.x = min(max(u_xlat16_31.x, 0.0), 1.0);
#else
    u_xlat16_31.x = clamp(u_xlat16_31.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_31.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_31.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.zxy;
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat16_16.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0.x = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_31.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_12.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_31.xy = u_xlat16_31.xy + u_xlat16_12.xy;
    u_xlat16_31.xy = u_xlat16_31.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_31.xy;
    u_xlat16_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat16_31.xyz = u_xlat16_0.zxy * _FlowLightUpColor.zxy;
    u_xlat16_12.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_12.xxx;
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_7.xyz = u_xlat16_31.xyz * u_xlat16_0.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_21.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_67 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
float u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_19;
mediump vec2 u_xlat16_20;
mediump float u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
ivec3 u_xlati24;
mediump float u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_32;
vec2 u_xlat34;
mediump vec2 u_xlat16_34;
mediump vec2 u_xlat16_39;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
vec2 u_xlat43;
int u_xlati43;
float u_xlat49;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
bool u_xlatb62;
float u_xlat63;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_39.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_39.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_20.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_20.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_20.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_20.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_20.x = u_xlat16_20.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_20.x * -2.0 + 3.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_2.x;
    u_xlat16_20.x = min(u_xlat16_20.x, 1.0);
    u_xlat16_2.x = u_xlat16_20.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _albedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(_EnableChangColor) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xxx;
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
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat23.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_3.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_3.xyz = vec3(u_xlat16_60) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat23.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = u_xlat16_3.xx * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_6.xyz = texture(_laserMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _laserColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_62;
    u_xlat16_3.x = u_xlat16_3.x * _laserColor.w;
    u_xlat16_2.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_7.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat23.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat6 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat6 * u_xlat6;
    u_xlat16_60 = u_xlat6 * u_xlat16_60;
    u_xlat16_60 = u_xlat6 * u_xlat16_60;
    u_xlat63 = (-u_xlat16_60) * u_xlat6 + 1.0;
    u_xlat16_60 = u_xlat6 * u_xlat16_60;
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(u_xlat63);
    u_xlat6 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat6) * vec3(u_xlat16_60) + u_xlat8.xyz;
    u_xlat63 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat65 = (-u_xlat63) * u_xlat16_60 + u_xlat63;
    u_xlat65 = u_xlat63 * u_xlat65 + u_xlat16_60;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat63 + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat5.xyz;
    u_xlat10 = dot(u_xlat16_9.xyz, u_xlat23.xyz);
    u_xlat11.x = u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat10) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat10 = max(u_xlat16_26, 0.00100000005);
    u_xlat10 = log2(u_xlat10);
    u_xlat10 = u_xlat10 * _customMatcapFresnelStrPow;
    u_xlat10 = exp2(u_xlat10);
    u_xlat10 = u_xlat10 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat10) * _stockingFresnelCol.xyz;
    u_xlat10 = (-u_xlat11.x) * u_xlat16_60 + u_xlat11.x;
    u_xlat10 = u_xlat11.x * u_xlat10 + u_xlat16_60;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = u_xlat10 + u_xlat11.x;
    u_xlat10 = u_xlat10 + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat10;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat49 = u_xlat16_60 + -1.0;
    u_xlat62 = u_xlat62 * u_xlat49 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_60 / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat62 = u_xlat65 * u_xlat62;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat63) * u_xlat8.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_13.xy = vec2(u_xlat16_26) * vs_TEXCOORD5.xy;
    u_xlat16_14.y = u_xlat16_13.y * _matCapSpeEffectedByLightDir;
    u_xlat15.xy = u_xlat23.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat15.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat23.xx + u_xlat15.xy;
    u_xlat15.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat23.zz + u_xlat15.xy;
    u_xlat16_32.xz = u_xlat15.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.z = 0.100000001;
    u_xlat16_14.x = _matCapSpeEffectedByLightDir;
    u_xlat16_13.xy = (-u_xlat16_13.xz) * u_xlat16_14.xy + u_xlat16_32.xz;
    u_xlat16_15.xyz = texture(_MatcapTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * _customMatcapCol.xyz;
    u_xlat16_13.xyz = vec3(u_xlat63) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xy = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_12.xyz = u_xlat16_15.yyy * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_26 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_26 = max(u_xlat16_26, 6.10351563e-05);
    u_xlat16_66 = u_xlat16_26 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = float(1.0) / float(u_xlat16_26);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_13.xyz = vec3(u_xlat16_26) * u_xlat8.xyz;
    u_xlat16_26 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_69 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_69);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_26) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + u_xlat16_13.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_26 = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat23.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat49 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_60 / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat8.x = dot(u_xlat23.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat16_26) + 1.0;
    u_xlat16_26 = u_xlat27.x * u_xlat27.x;
    u_xlat16_26 = u_xlat27.x * u_xlat16_26;
    u_xlat16_26 = u_xlat27.x * u_xlat16_26;
    u_xlat16_66 = u_xlat27.x * u_xlat16_26;
    u_xlat27.x = (-u_xlat16_26) * u_xlat27.x + 1.0;
    u_xlat27.xyz = u_xlat16_3.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat6) * vec3(u_xlat16_66) + u_xlat27.xyz;
    u_xlat68 = (-u_xlat8.x) * u_xlat16_60 + u_xlat8.x;
    u_xlat68 = u_xlat8.x * u_xlat68 + u_xlat16_60;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat8.x + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat10 * u_xlat68;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat62 = u_xlat62 * u_xlat68;
    u_xlat27.xyz = u_xlat27.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat8.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat16_14.xyz * u_xlat27.xyz;
    u_xlat16_34.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat34.xy = u_xlat16_34.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xy = min(max(u_xlat34.xy, 0.0), 1.0);
#else
    u_xlat34.xy = clamp(u_xlat34.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat27.xyz * u_xlat34.xxx + u_xlat16_12.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_26 = max(u_xlat16_26, 6.10351563e-05);
    u_xlat16_66 = u_xlat16_26 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = float(1.0) / float(u_xlat16_26);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_13.xyz = vec3(u_xlat16_26) * u_xlat27.xyz;
    u_xlat16_26 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_69);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66;
    u_xlat16_16.xyz = vec3(u_xlat16_26) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + u_xlat16_13.xyz;
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat5.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat23.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat16_13.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat23.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat16_59) + 1.0;
    u_xlat43.x = u_xlat62 * u_xlat62;
    u_xlat43.x = u_xlat43.x * u_xlat49 + 1.0;
    u_xlat43.x = u_xlat43.x * u_xlat43.x;
    u_xlat43.x = u_xlat16_60 / u_xlat43.x;
    u_xlat43.x = u_xlat43.x * 0.318309873;
    u_xlat62 = (-u_xlat5.x) * u_xlat16_60 + u_xlat5.x;
    u_xlat62 = u_xlat5.x * u_xlat62 + u_xlat16_60;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat5.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat62 * u_xlat10;
    u_xlat43.y = float(1.0) / u_xlat62;
    u_xlat43.xy = min(u_xlat43.xy, vec2(16.0, 16.0));
    u_xlat43.x = u_xlat43.y * u_xlat43.x;
    u_xlat16_59 = u_xlat24.x * u_xlat24.x;
    u_xlat16_59 = u_xlat24.x * u_xlat16_59;
    u_xlat16_59 = u_xlat24.x * u_xlat16_59;
    u_xlat16_26 = u_xlat24.x * u_xlat16_59;
    u_xlat24.x = (-u_xlat16_59) * u_xlat24.x + 1.0;
    u_xlat27.xyz = u_xlat16_3.xyz * u_xlat24.xxx;
    u_xlat27.xyz = vec3(u_xlat6) * vec3(u_xlat16_26) + u_xlat27.xyz;
    u_xlat24.xyz = u_xlat43.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat24.xyz = u_xlat5.xxx * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16_16.xyz * u_xlat24.xyz;
    u_xlat16_12.xyz = u_xlat24.xyz * u_xlat34.yyy + u_xlat16_12.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_59) * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat34.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat8.xxx * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat63) + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat34.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat5.xxx + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat0.xyz) * u_xlat4.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat23.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_26 = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_26 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_26) + u_xlat16_66;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_26 = u_xlat16_7.w * u_xlat16_66 + u_xlat16_26;
    u_xlat16_26 = u_xlat16_7.w * u_xlat16_26;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66;
    u_xlat5.x = min(u_xlat16_26, 1.0);
    u_xlat24.x = min(u_xlat5.x, u_xlat16_6.z);
    u_xlat16_14.xyz = u_xlat24.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat24.xxx * u_xlat16_14.xyz;
    u_xlat16_17.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat24.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_17.xyz * u_xlat24.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati43 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati43].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati43 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_70 = dot((-u_xlat16_9.xyz), u_xlat23.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat24.xyz = (-u_xlat23.xyz) * vec3(u_xlat16_70) + (-u_xlat16_9.xyz);
    u_xlat23.x = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_16.xyz, u_xlat24.xyz);
    u_xlat16_14.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_70 = floor(u_xlat16_2.w);
    u_xlat16_14.x = u_xlat16_70 + 1.0;
    u_xlat16_14.x = min(u_xlat16_14.x, 15.0);
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_70 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_70 = u_xlat16_14.z * 15.0 + (-u_xlat16_70);
    u_xlat16_14.x = (-u_xlat16_61) + u_xlat16_42;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_14.x + u_xlat16_61;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat23.x = u_xlat23.x * u_xlat16_66;
    u_xlat16_66 = u_xlat5.x * 0.5;
    u_xlat16_70 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat23.x * u_xlat16_70 + u_xlat16_66;
    u_xlat16_70 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_14.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_14.x + u_xlat16_70;
    u_xlat16_66 = u_xlat5.x * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_6.z, u_xlat16_66);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + (-u_xlat24.xyz);
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat0.xyz + u_xlat24.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_60 = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat11.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_60);
    u_xlat16_16.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_66) * u_xlat16_3.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat0.xy = u_xlat16_9.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_9.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_9.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_41.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_41.xx;
    u_xlat16_0.x = texture(_MergeTex00, u_xlat0.xy).x;
    u_xlat19.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat19.xy = u_xlat19.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_19 = texture(_MergeTex00, u_xlat19.xy).x;
    u_xlat16_41.x = u_xlat16_0.x * u_xlat16_19;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_41.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.xyz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_15.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0.x = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_41.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_12.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_41.xy = u_xlat16_41.xy + u_xlat16_12.xy;
    u_xlat16_41.xy = u_xlat16_41.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_41.xy;
    u_xlat16_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _FlowLightUpColor.xyz;
    u_xlat16_41.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_12.xyz = u_xlat16_41.xxx * u_xlat16_12.xyz;
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_20.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_22;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
float u_xlat10;
vec2 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec4 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec2 u_xlat19;
mediump float u_xlat16_19;
mediump vec2 u_xlat16_20;
mediump float u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
ivec3 u_xlati24;
mediump float u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_32;
vec2 u_xlat34;
mediump vec2 u_xlat16_34;
mediump vec2 u_xlat16_39;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_42;
vec2 u_xlat43;
int u_xlati43;
float u_xlat49;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_61;
float u_xlat62;
mediump float u_xlat16_62;
bool u_xlatb62;
float u_xlat63;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat68;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_39.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_39.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_20.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_20.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_20.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_20.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_20.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_20.x = u_xlat16_20.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20.x = min(max(u_xlat16_20.x, 0.0), 1.0);
#else
    u_xlat16_20.x = clamp(u_xlat16_20.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_20.x * -2.0 + 3.0;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_20.x;
    u_xlat16_20.x = u_xlat16_20.x * u_xlat16_2.x;
    u_xlat16_20.x = min(u_xlat16_20.x, 1.0);
    u_xlat16_2.x = u_xlat16_20.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _albedoColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _AlbedoChangColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = vec3(_EnableChangColor) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_59 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_59) + vs_TEXCOORD2.yzx;
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xxx;
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
    u_xlat4.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat4.x = max(u_xlat4.x, 1.17549435e-38);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat23.xyz = u_xlat0.xyz * u_xlat4.xxx;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_3.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_60 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_3.xyz = vec3(u_xlat16_60) * u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat23.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.xy = u_xlat16_3.xx * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_6.xyz = texture(_laserMap, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _laserColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = (-u_xlat16_2.xyz) + u_xlat16_3.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_62 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_62;
    u_xlat16_3.x = u_xlat16_3.x * _laserColor.w;
    u_xlat16_2.xyz = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_6.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xy = u_xlat16_6.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_7.yyy * u_xlat16_3.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_60 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat23.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat6 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat6 * u_xlat6;
    u_xlat16_60 = u_xlat6 * u_xlat16_60;
    u_xlat16_60 = u_xlat6 * u_xlat16_60;
    u_xlat63 = (-u_xlat16_60) * u_xlat6 + 1.0;
    u_xlat16_60 = u_xlat6 * u_xlat16_60;
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(u_xlat63);
    u_xlat6 = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat8.xyz = vec3(u_xlat6) * vec3(u_xlat16_60) + u_xlat8.xyz;
    u_xlat63 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = max(u_xlat16_60, 0.0078125);
    u_xlat65 = (-u_xlat63) * u_xlat16_60 + u_xlat63;
    u_xlat65 = u_xlat63 * u_xlat65 + u_xlat16_60;
    u_xlat65 = sqrt(u_xlat65);
    u_xlat65 = u_xlat63 + u_xlat65;
    u_xlat65 = u_xlat65 + 6.10351563e-05;
    u_xlat16_9.xyz = vec3(u_xlat16_59) * u_xlat5.xyz;
    u_xlat10 = dot(u_xlat16_9.xyz, u_xlat23.xyz);
    u_xlat11.x = u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_26 = (-u_xlat10) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat10 = max(u_xlat16_26, 0.00100000005);
    u_xlat10 = log2(u_xlat10);
    u_xlat10 = u_xlat10 * _customMatcapFresnelStrPow;
    u_xlat10 = exp2(u_xlat10);
    u_xlat10 = u_xlat10 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat10) * _stockingFresnelCol.xyz;
    u_xlat10 = (-u_xlat11.x) * u_xlat16_60 + u_xlat11.x;
    u_xlat10 = u_xlat11.x * u_xlat10 + u_xlat16_60;
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = u_xlat10 + u_xlat11.x;
    u_xlat10 = u_xlat10 + 6.10351563e-05;
    u_xlat65 = u_xlat65 * u_xlat10;
    u_xlat65 = float(1.0) / u_xlat65;
    u_xlat65 = min(u_xlat65, 16.0);
    u_xlat49 = u_xlat16_60 + -1.0;
    u_xlat62 = u_xlat62 * u_xlat49 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_60 / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat62 = u_xlat65 * u_xlat62;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = vec3(u_xlat63) * u_xlat8.xyz;
    u_xlat16_26 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_13.xy = vec2(u_xlat16_26) * vs_TEXCOORD5.xy;
    u_xlat16_14.y = u_xlat16_13.y * _matCapSpeEffectedByLightDir;
    u_xlat15.xy = u_xlat23.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat15.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat23.xx + u_xlat15.xy;
    u_xlat15.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat23.zz + u_xlat15.xy;
    u_xlat16_32.xz = u_xlat15.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.z = 0.100000001;
    u_xlat16_14.x = _matCapSpeEffectedByLightDir;
    u_xlat16_13.xy = (-u_xlat16_13.xz) * u_xlat16_14.xy + u_xlat16_32.xz;
    u_xlat16_15.xyz = texture(_MatcapTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * _customMatcapCol.xyz;
    u_xlat16_13.xyz = vec3(u_xlat63) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat8.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xy = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_12.xyz = u_xlat16_15.yyy * u_xlat16_12.xyz + u_xlat8.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_26 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_26 = max(u_xlat16_26, 6.10351563e-05);
    u_xlat16_66 = u_xlat16_26 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = float(1.0) / float(u_xlat16_26);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_13.xyz = vec3(u_xlat16_26) * u_xlat8.xyz;
    u_xlat16_26 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_14.x);
    u_xlat16_14.xzw = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_14.xzw;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_69 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_69);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_26) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat8.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + u_xlat16_13.xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_26 = dot(u_xlat16_13.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat62 = dot(u_xlat23.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat62 * u_xlat49 + 1.0;
    u_xlat62 = u_xlat62 * u_xlat62;
    u_xlat62 = u_xlat16_60 / u_xlat62;
    u_xlat62 = u_xlat62 * 0.318309873;
    u_xlat62 = min(u_xlat62, 16.0);
    u_xlat8.x = dot(u_xlat23.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat27.x = (-u_xlat16_26) + 1.0;
    u_xlat16_26 = u_xlat27.x * u_xlat27.x;
    u_xlat16_26 = u_xlat27.x * u_xlat16_26;
    u_xlat16_26 = u_xlat27.x * u_xlat16_26;
    u_xlat16_66 = u_xlat27.x * u_xlat16_26;
    u_xlat27.x = (-u_xlat16_26) * u_xlat27.x + 1.0;
    u_xlat27.xyz = u_xlat16_3.xyz * u_xlat27.xxx;
    u_xlat27.xyz = vec3(u_xlat6) * vec3(u_xlat16_66) + u_xlat27.xyz;
    u_xlat68 = (-u_xlat8.x) * u_xlat16_60 + u_xlat8.x;
    u_xlat68 = u_xlat8.x * u_xlat68 + u_xlat16_60;
    u_xlat68 = sqrt(u_xlat68);
    u_xlat68 = u_xlat8.x + u_xlat68;
    u_xlat68 = u_xlat68 + 6.10351563e-05;
    u_xlat68 = u_xlat10 * u_xlat68;
    u_xlat68 = float(1.0) / u_xlat68;
    u_xlat68 = min(u_xlat68, 16.0);
    u_xlat62 = u_xlat62 * u_xlat68;
    u_xlat27.xyz = u_xlat27.xyz * vec3(u_xlat62);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.xyz = min(max(u_xlat27.xyz, 0.0), 1.0);
#else
    u_xlat27.xyz = clamp(u_xlat27.xyz, 0.0, 1.0);
#endif
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat8.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat16_14.xyz * u_xlat27.xyz;
    u_xlat16_34.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat34.xy = u_xlat16_34.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat34.xy = min(max(u_xlat34.xy, 0.0), 1.0);
#else
    u_xlat34.xy = clamp(u_xlat34.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat27.xyz * u_xlat34.xxx + u_xlat16_12.xyz;
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_26 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat16_26 = max(u_xlat16_26, 6.10351563e-05);
    u_xlat16_66 = u_xlat16_26 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_69 = float(1.0) / float(u_xlat16_26);
    u_xlat16_26 = inversesqrt(u_xlat16_26);
    u_xlat16_13.xyz = vec3(u_xlat16_26) * u_xlat27.xyz;
    u_xlat16_26 = u_xlat16_66 * u_xlat16_69;
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb62 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_16.xy = (bool(u_xlatb62)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26 = max(u_xlat16_26, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb62 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_69 = (u_xlatb62) ? 1.0 : 0.0;
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_69);
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66;
    u_xlat16_16.xyz = vec3(u_xlat16_26) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_59) + u_xlat16_13.xyz;
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat5.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat62 = dot(u_xlat23.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_59 = dot(u_xlat16_13.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat23.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat24.x = (-u_xlat16_59) + 1.0;
    u_xlat43.x = u_xlat62 * u_xlat62;
    u_xlat43.x = u_xlat43.x * u_xlat49 + 1.0;
    u_xlat43.x = u_xlat43.x * u_xlat43.x;
    u_xlat43.x = u_xlat16_60 / u_xlat43.x;
    u_xlat43.x = u_xlat43.x * 0.318309873;
    u_xlat62 = (-u_xlat5.x) * u_xlat16_60 + u_xlat5.x;
    u_xlat62 = u_xlat5.x * u_xlat62 + u_xlat16_60;
    u_xlat62 = sqrt(u_xlat62);
    u_xlat62 = u_xlat62 + u_xlat5.x;
    u_xlat62 = u_xlat62 + 6.10351563e-05;
    u_xlat62 = u_xlat62 * u_xlat10;
    u_xlat43.y = float(1.0) / u_xlat62;
    u_xlat43.xy = min(u_xlat43.xy, vec2(16.0, 16.0));
    u_xlat43.x = u_xlat43.y * u_xlat43.x;
    u_xlat16_59 = u_xlat24.x * u_xlat24.x;
    u_xlat16_59 = u_xlat24.x * u_xlat16_59;
    u_xlat16_59 = u_xlat24.x * u_xlat16_59;
    u_xlat16_26 = u_xlat24.x * u_xlat16_59;
    u_xlat24.x = (-u_xlat16_59) * u_xlat24.x + 1.0;
    u_xlat27.xyz = u_xlat16_3.xyz * u_xlat24.xxx;
    u_xlat27.xyz = vec3(u_xlat6) * vec3(u_xlat16_26) + u_xlat27.xyz;
    u_xlat24.xyz = u_xlat43.xxx * u_xlat27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat24.xyz = u_xlat5.xxx * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16_16.xyz * u_xlat24.xyz;
    u_xlat16_12.xyz = u_xlat24.xyz * u_xlat34.yyy + u_xlat16_12.xyz;
    u_xlat16_59 = (-u_xlat16_6.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_59) * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat34.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat8.xxx * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_2.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(u_xlat63) + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat34.yyy * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat5.xxx + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat0.xyz) * u_xlat4.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat23.xyz;
    u_xlat16_59 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_16.xyz = vec3(u_xlat16_59) * u_xlat16_16.xyz;
    u_xlat16_26 = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_26 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_26) + u_xlat16_66;
    u_xlat16_69 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_7.w = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_26 = u_xlat16_7.w * u_xlat16_66 + u_xlat16_26;
    u_xlat16_26 = u_xlat16_7.w * u_xlat16_26;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_66;
    u_xlat5.x = min(u_xlat16_26, 1.0);
    u_xlat24.x = min(u_xlat5.x, u_xlat16_6.z);
    u_xlat16_14.xyz = u_xlat24.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat24.xxx * u_xlat16_14.xyz;
    u_xlat16_17.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat24.xxx + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_17.xyz * u_xlat24.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_17.y = u_xlat16_16.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati24.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_18.xyz;
    u_xlati43 = int(int_bitfieldInsert(2,u_xlati24.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati43].xyz;
    u_xlati24.x = int(uint(uint(u_xlati24.x) & 1u));
    u_xlati43 = (u_xlati24.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati24.x].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati43].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_69 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_17.xyz = u_xlat16_2.xyz * u_xlat16_18.xyz;
    u_xlat16_13.xyz = u_xlat16_17.xyz * u_xlat16_14.xyz + u_xlat16_13.xyz;
    u_xlat16_70 = dot((-u_xlat16_9.xyz), u_xlat23.xyz);
    u_xlat16_70 = u_xlat16_70 + u_xlat16_70;
    u_xlat24.xyz = (-u_xlat23.xyz) * vec3(u_xlat16_70) + (-u_xlat16_9.xyz);
    u_xlat23.x = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_7.z = dot(u_xlat16_16.xyz, u_xlat24.xyz);
    u_xlat16_14.xyz = u_xlat16_7.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_70 = floor(u_xlat16_2.w);
    u_xlat16_14.x = u_xlat16_70 + 1.0;
    u_xlat16_14.x = min(u_xlat16_14.x, 15.0);
    u_xlat16_2.x = u_xlat16_14.x * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_42 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_2.x = u_xlat16_70 * 16.0 + u_xlat16_2.z;
    u_xlat16_14.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_61 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_70 = u_xlat16_14.z * 15.0 + (-u_xlat16_70);
    u_xlat16_14.x = (-u_xlat16_61) + u_xlat16_42;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_14.x + u_xlat16_61;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat23.x = u_xlat23.x * u_xlat16_66;
    u_xlat16_66 = u_xlat5.x * 0.5;
    u_xlat16_70 = (-u_xlat5.x) * 0.5 + 1.0;
    u_xlat16_66 = u_xlat23.x * u_xlat16_70 + u_xlat16_66;
    u_xlat16_70 = u_xlat16_66 + u_xlat16_66;
    u_xlat16_14.x = (-u_xlat16_66) * 2.0 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_14.x + u_xlat16_70;
    u_xlat16_66 = u_xlat5.x * u_xlat16_66;
    u_xlat16_66 = min(u_xlat16_6.z, u_xlat16_66);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + (-u_xlat24.xyz);
    u_xlat0.xyz = vec3(u_xlat16_60) * u_xlat0.xyz + u_xlat24.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_60 = u_xlat16_7.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_7.x);
    u_xlat11.y = u_xlat16_7.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat11.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_60);
    u_xlat16_16.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_16.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_16.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_16.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_16.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_66) * u_xlat16_3.xyz;
    u_xlat16_16.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_16.xyz = min(max(u_xlat16_16.xyz, 0.0), 1.0);
#else
    u_xlat16_16.xyz = clamp(u_xlat16_16.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_3.x = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_0.w * _albedoColor.w + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_22 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _emissiveColor.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz + u_xlat16_13.xyz;
    u_xlat0.xy = u_xlat16_9.yy * vs_TEXCOORD8.xy;
    u_xlat0.xy = vs_TEXCOORD7.xy * u_xlat16_9.xx + u_xlat0.xy;
    u_xlat0.xy = vs_TEXCOORD9.xy * u_xlat16_9.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat0.xy);
    u_xlat4.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat0.xy);
    u_xlat0.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_41.x = _GlitterScale * 0.681690156;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_41.xx;
    u_xlat16_0.x = texture(_MergeTex00, u_xlat0.xy).x;
    u_xlat19.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat19.xy = u_xlat19.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_19 = texture(_MergeTex00, u_xlat19.xy).x;
    u_xlat16_41.x = u_xlat16_0.x * u_xlat16_19;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_41.x = u_xlat16_41.x * _GlitterIntensity;
    u_xlat0.x = max(u_xlat16_41.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlitterContrast;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _GlitterColor.xyz;
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat16_15.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0.x = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_41.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_12.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_41.xy = u_xlat16_41.xy + u_xlat16_12.xy;
    u_xlat16_41.xy = u_xlat16_41.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_41.xy;
    u_xlat16_0.xyz = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * _FlowLightUpColor.xyz;
    u_xlat16_41.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_12.xyz = u_xlat16_41.xxx * u_xlat16_12.xyz;
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_9.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_20.xxx + u_xlat16_9.xyz;
    u_xlat16_9.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_9.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_3.x : u_xlat16_22;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(13) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(15) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec4 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_22;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump float u_xlat16_25;
vec3 u_xlat26;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec2 u_xlat16_43;
vec2 u_xlat46;
int u_xlati46;
float u_xlat47;
mediump float u_xlat16_47;
float u_xlat51;
float u_xlat66;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_43.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_43.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_22.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_22.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_22.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_22.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_22.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_22.x = u_xlat16_22.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_2.x;
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_2.x = u_xlat16_22.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
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
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat8.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat24.x = max((-u_xlat0.w), u_xlat3.x);
    u_xlat24.x = (-u_xlat3.x) + u_xlat24.x;
    u_xlat0.z = _ShadowBias.y * u_xlat24.x + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat24.x = (-u_xlat16_7.x) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat24.x + u_xlat16_7.x;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat3.x) * u_xlat16_7.x + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat3.x>=0.99000001);
#else
    u_xlatb4 = u_xlat3.x>=0.99000001;
#endif
    u_xlat16_7.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.x = max(u_xlat66, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat4.xxx * u_xlat16_28.xyz + _shadowColor.xyz;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat4.xx + vec2(1.0, 1.0);
    u_xlat16_11.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD5.xy;
    u_xlat16_12.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_12.x = _matCapSpeEffectedByLightDir;
    u_xlat46.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat46.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat46.xy;
    u_xlat46.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat46.xy;
    u_xlat16_32.xz = u_xlat46.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_12.xy + u_xlat16_32.xz;
    u_xlat16_5.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * _customMatcapCol.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    u_xlat46.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.x = min(max(u_xlat46.x, 0.0), 1.0);
#else
    u_xlat46.x = clamp(u_xlat46.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat46.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat16_7.xxx;
    u_xlat9.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
    u_xlat16_74 = (-u_xlat9.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat67 = max(u_xlat16_74, 0.00100000005);
    u_xlat67 = log2(u_xlat67);
    u_xlat67 = u_xlat67 * _customMatcapFresnelStrPow;
    u_xlat67 = exp2(u_xlat67);
    u_xlat67 = u_xlat67 * _customMatcapFresnelStr;
    u_xlat16_13.xyz = vec3(u_xlat67) * _stockingFresnelCol.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_28.xyz + u_xlat16_13.xyz;
    u_xlat16_10.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _albedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_74 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_14.xyz = vec3(u_xlat16_74) * u_xlat16_14.xyz;
    u_xlat16_74 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_74) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_10.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) + u_xlat16_14.xyz;
    u_xlat16_74 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_67 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_67;
    u_xlat16_74 = u_xlat16_74 * _laserColor.w;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xy = u_xlat16_10.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = u_xlat5.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat68 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat68 * u_xlat68;
    u_xlat16_74 = u_xlat68 * u_xlat16_74;
    u_xlat16_74 = u_xlat68 * u_xlat16_74;
    u_xlat71 = (-u_xlat16_74) * u_xlat68 + 1.0;
    u_xlat16_74 = u_xlat68 * u_xlat16_74;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat71);
    u_xlat68 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat68) * vec3(u_xlat16_74) + u_xlat16.xyz;
    u_xlat16_74 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat71 = (-u_xlat46.x) * u_xlat16_74 + u_xlat46.x;
    u_xlat71 = u_xlat46.x * u_xlat71 + u_xlat16_74;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat46.x + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat51 = (-u_xlat9.x) * u_xlat16_74 + u_xlat9.x;
    u_xlat51 = u_xlat9.x * u_xlat51 + u_xlat16_74;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat9.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat51;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = u_xlat16_74 + -1.0;
    u_xlat67 = u_xlat67 * u_xlat72 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_74 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat67 = u_xlat71 * u_xlat67;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat67);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat46.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = (-u_xlat16.xyz) * u_xlat16_28.xyz + u_xlat16_11.xyz;
    u_xlat16.xyz = u_xlat16_28.xyz * u_xlat16.xyz;
    u_xlat16_10.xw = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_11.xyz = u_xlat16_10.www * u_xlat16_11.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16.xyz;
    u_xlat16_75 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_76;
    u_xlat16_17.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16.xyz = u_xlat5.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16_75 = dot(u_xlat16_15.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat72 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_74 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat71 = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat73 * u_xlat73;
    u_xlat16_75 = u_xlat73 * u_xlat16_75;
    u_xlat16_75 = u_xlat73 * u_xlat16_75;
    u_xlat16_76 = u_xlat73 * u_xlat16_75;
    u_xlat73 = (-u_xlat16_75) * u_xlat73 + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat16.xyz = vec3(u_xlat68) * vec3(u_xlat16_76) + u_xlat16.xyz;
    u_xlat73 = (-u_xlat71) * u_xlat16_74 + u_xlat71;
    u_xlat73 = u_xlat71 * u_xlat73 + u_xlat16_74;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat71 + u_xlat73;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat73 = u_xlat51 * u_xlat73;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat67 = u_xlat67 * u_xlat73;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat67);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_17.xyz * u_xlat16.xyz;
    u_xlat16_11.xyz = u_xlat16.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16.xyz;
    u_xlat16_75 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_18.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_76;
    u_xlat16_18.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat67 = dot(u_xlat8.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat16_7.x = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_7.x) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat72 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_74 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat47 = (-u_xlat5.x) * u_xlat16_74 + u_xlat5.x;
    u_xlat47 = u_xlat5.x * u_xlat47 + u_xlat16_74;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat5.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat47 = u_xlat47 * u_xlat51;
    u_xlat47 = float(1.0) / u_xlat47;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat67 = u_xlat67 * u_xlat47;
    u_xlat16_7.x = u_xlat26.x * u_xlat26.x;
    u_xlat16_7.x = u_xlat26.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat26.x * u_xlat16_7.x;
    u_xlat16_75 = u_xlat26.x * u_xlat16_7.x;
    u_xlat26.x = (-u_xlat16_7.x) * u_xlat26.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat68) * vec3(u_xlat16_75) + u_xlat16.xyz;
    u_xlat26.xyz = vec3(u_xlat67) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat26.xyz = u_xlat5.xxx * u_xlat26.xyz;
    u_xlat26.xyz = u_xlat16_18.xyz * u_xlat26.xyz;
    u_xlat16_11.xyz = u_xlat26.xyz * u_xlat24.yyy + u_xlat16_11.xyz;
    u_xlat16_7.x = (-u_xlat16_10.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_28.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat24.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat71) * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat46.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat24.yyy * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_15.xyz * u_xlat5.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_70 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlat16_70 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_70) + u_xlat16_75;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_70 = u_xlat16_2.w * u_xlat16_75 + u_xlat16_70;
    u_xlat16_70 = u_xlat16_2.w * u_xlat16_70;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_75;
    u_xlat4.xy = min(u_xlat4.xy, vec2(u_xlat16_70));
    u_xlat4.x = min(u_xlat4.x, u_xlat16_10.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat4.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat4.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_19.y = u_xlat16_17.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati4.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati4.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati46 = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat4.xzw = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_12.xyz);
    u_xlat5.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_17.xyz, u_xlat4.xzw);
    u_xlat16_13.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_3.w);
    u_xlat16_34.x = u_xlat16_13.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_3.x = u_xlat16_34.x * 16.0 + u_xlat16_3.z;
    u_xlat16_34.xz = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_3.x = u_xlat16_13.x * 16.0 + u_xlat16_3.z;
    u_xlat16_34.xz = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_47 = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_34.x = (-u_xlat16_47) + u_xlat16_26;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_34.x + u_xlat16_47;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_13.x;
    u_xlat5.x = u_xlat5.x * u_xlat16_75;
    u_xlat16_75 = u_xlat4.y * 0.5;
    u_xlat16_13.x = (-u_xlat4.y) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat5.x * u_xlat16_13.x + u_xlat16_75;
    u_xlat16_13.x = u_xlat16_75 + u_xlat16_75;
    u_xlat16_34.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_34.x + u_xlat16_13.x;
    u_xlat16_75 = u_xlat4.y * u_xlat16_75;
    u_xlat16_75 = min(u_xlat16_10.z, u_xlat16_75);
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat69) + (-u_xlat4.xzw);
    u_xlat4.xyz = vec3(u_xlat16_74) * u_xlat5.xyz + u_xlat4.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat13.y = u_xlat4.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_74 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_74);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb4 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb4)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz;
    u_xlat16_17.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_70 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_32.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat4.xy = u_xlat16_12.yy * vs_TEXCOORD8.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_12.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD9.xy * u_xlat16_12.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_32.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat4.xy * u_xlat16_32.xx;
    u_xlat16_4.x = texture(_MergeTex00, u_xlat4.xy).x;
    u_xlat25.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_25 = texture(_MergeTex00, u_xlat25.xy).x;
    u_xlat16_32.x = u_xlat16_4.x * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * _GlitterIntensity;
    u_xlat4.x = max(u_xlat16_32.x, 0.00100000005);
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _GlitterContrast;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _GlitterColor.xyz;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_10.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb4 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_32.xy = (bool(u_xlatb4)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_12.xy = (bool(u_xlatb4)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_32.xy = u_xlat16_32.xy + u_xlat16_12.xy;
    u_xlat16_32.xy = u_xlat16_32.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat4.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_32.xy;
    u_xlat16_4.xyz = texture(_FlowLightTex, u_xlat4.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_4.xyz * _FlowLightUpColor.xyz;
    u_xlat16_12.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_12.xxx;
    u_xlat16_4.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_4.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_22.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb4 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_70 : u_xlat16_11.x;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
out mediump vec3 vs_TEXCOORD5;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump float _EnableChangColor;
uniform 	vec4 _laserMap_ST;
uniform 	mediump vec4 _laserColor;
uniform 	mediump float _laserIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _DissolveTexScale;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _DissolveEdgeRange;
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
uniform 	mediump float _occlusionScale;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _AlbedoChangTex;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _laserMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex00;
UNITY_LOCATION(13) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(15) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD7;
in highp vec3 vs_TEXCOORD8;
in highp vec3 vs_TEXCOORD9;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec4 u_xlati4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec2 u_xlat16_22;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec2 u_xlat25;
mediump float u_xlat16_25;
vec3 u_xlat26;
mediump float u_xlat16_26;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec2 u_xlat16_43;
vec2 u_xlat46;
int u_xlati46;
float u_xlat47;
mediump float u_xlat16_47;
float u_xlat51;
float u_xlat66;
float u_xlat67;
mediump float u_xlat16_67;
bool u_xlatb67;
float u_xlat68;
float u_xlat69;
mediump float u_xlat16_70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
mediump float u_xlat16_74;
mediump float u_xlat16_75;
mediump float u_xlat16_76;
mediump float u_xlat16_77;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_43.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_43.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_22.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_22.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _Cutoff;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_22.xy = vs_TEXCOORD3.xy * _DissolveTexScale.xy + _DissolveTexScale.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_22.xy;
    u_xlat16_0.x = texture(_MergeTex01, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveEdgeShrink + u_xlat16_0.x;
    u_xlat16_22.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveEdgeRange, _DissolveEdgeRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveEdgeRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_22.x = u_xlat16_22.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_2.x;
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_2.x = u_xlat16_22.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
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
    u_xlatb5 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb5 = _ShadowBias.z!=0.0;
#endif
    u_xlat26.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat6.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat26.xyz = u_xlat26.xyz * u_xlat6.xxx;
    u_xlat6.z = vs_TEXCOORD1.x;
    u_xlat16_7.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_7.xxx + vs_TEXCOORD2.yzx;
    u_xlat69 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat16_7.xyz;
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
    u_xlat69 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat69 = max(u_xlat69, 1.17549435e-38);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat8.xyz = vec3(u_xlat69) * u_xlat6.xyz;
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat26.xyz);
    u_xlat26.x = (-u_xlat26.x) * u_xlat26.x + 1.0;
    u_xlat26.x = sqrt(u_xlat26.x);
    u_xlat26.x = u_xlat26.x * _ShadowBias.z;
    u_xlat26.xyz = (-u_xlat8.xyz) * u_xlat26.xxx + vs_TEXCOORD0.xyz;
    u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat26.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = u_xlat4 * u_xlat5.yyyy;
    u_xlat3 = u_xlat3 * u_xlat5.xxxx + u_xlat4;
    u_xlat2 = u_xlat2 * u_xlat5.zzzz + u_xlat3;
    u_xlat0 = u_xlat0 + u_xlat2;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat24.x = max((-u_xlat0.w), u_xlat3.x);
    u_xlat24.x = (-u_xlat3.x) + u_xlat24.x;
    u_xlat0.z = _ShadowBias.y * u_xlat24.x + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlat24.x = (-u_xlat16_7.x) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat24.x + u_xlat16_7.x;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat16_24.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_7.x = u_xlat16_24.z * _shadowStrength;
    u_xlat24.xy = u_xlat16_24.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xy = min(max(u_xlat24.xy, 0.0), 1.0);
#else
    u_xlat24.xy = clamp(u_xlat24.xy, 0.0, 1.0);
#endif
    u_xlat66 = (-u_xlat3.x) * u_xlat16_7.x + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat3.x>=0.99000001);
#else
    u_xlatb4 = u_xlat3.x>=0.99000001;
#endif
    u_xlat16_7.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.x = max(u_xlat66, 0.0);
    u_xlat16_28.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_28.xyz = u_xlat4.xxx * u_xlat16_28.xyz + _shadowColor.xyz;
    u_xlat4.x = u_xlat4.x + -1.0;
    u_xlat4.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat4.xx + vec2(1.0, 1.0);
    u_xlat16_11.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_11.x = inversesqrt(u_xlat16_11.x);
    u_xlat16_11.xy = u_xlat16_11.xx * vs_TEXCOORD5.xy;
    u_xlat16_12.y = u_xlat16_11.y * _matCapSpeEffectedByLightDir;
    u_xlat16_11.z = 0.100000001;
    u_xlat16_12.x = _matCapSpeEffectedByLightDir;
    u_xlat46.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat46.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat46.xy;
    u_xlat46.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat46.xy;
    u_xlat16_32.xz = u_xlat46.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_11.xy = (-u_xlat16_11.xz) * u_xlat16_12.xy + u_xlat16_32.xz;
    u_xlat16_5.xyz = texture(_MatcapTex, u_xlat16_11.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_5.xyz * _customMatcapCol.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    u_xlat46.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.x = min(max(u_xlat46.x, 0.0), 1.0);
#else
    u_xlat46.x = clamp(u_xlat46.x, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat46.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat16_7.xxx;
    u_xlat9.x = dot(u_xlat16_12.xyz, u_xlat8.xyz);
    u_xlat16_74 = (-u_xlat9.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat67 = max(u_xlat16_74, 0.00100000005);
    u_xlat67 = log2(u_xlat67);
    u_xlat67 = u_xlat67 * _customMatcapFresnelStrPow;
    u_xlat67 = exp2(u_xlat67);
    u_xlat67 = u_xlat67 * _customMatcapFresnelStr;
    u_xlat16_13.xyz = vec3(u_xlat67) * _stockingFresnelCol.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_28.xyz + u_xlat16_13.xyz;
    u_xlat16_10.xyz = texture(_AlbedoChangTex, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_10.xyz * u_xlat16_13.xyz;
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_0.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _albedoColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _AlbedoChangColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = vec3(_EnableChangColor) * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat5.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_74 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_74 = inversesqrt(u_xlat16_74);
    u_xlat16_14.xyz = vec3(u_xlat16_74) * u_xlat16_14.xyz;
    u_xlat16_74 = dot(u_xlat8.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat16_14.xy = vec2(u_xlat16_74) * _laserMap_ST.xy + _laserMap_ST.zw;
    u_xlat16_10.xyz = texture(_laserMap, u_xlat16_14.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _laserColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(_laserIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = (-u_xlat16_13.xyz) + u_xlat16_14.xyz;
    u_xlat16_74 = dot(u_xlat16_14.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_67 = texture(_laserMap, vs_TEXCOORD3.xy).w;
    u_xlat16_74 = u_xlat16_74 * u_xlat16_67;
    u_xlat16_74 = u_xlat16_74 * _laserColor.w;
    u_xlat16_13.xyz = vec3(u_xlat16_74) * u_xlat16_15.xyz + u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = texture(_materialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xy = u_xlat16_10.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_14.xyz = u_xlat16_2.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16.xyz = u_xlat5.xyz * u_xlat16_7.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16_74 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_74 = min(max(u_xlat16_74, 0.0), 1.0);
#else
    u_xlat16_74 = clamp(u_xlat16_74, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat68 = (-u_xlat16_74) + 1.0;
    u_xlat16_74 = u_xlat68 * u_xlat68;
    u_xlat16_74 = u_xlat68 * u_xlat16_74;
    u_xlat16_74 = u_xlat68 * u_xlat16_74;
    u_xlat71 = (-u_xlat16_74) * u_xlat68 + 1.0;
    u_xlat16_74 = u_xlat68 * u_xlat16_74;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat71);
    u_xlat68 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat68 = min(max(u_xlat68, 0.0), 1.0);
#else
    u_xlat68 = clamp(u_xlat68, 0.0, 1.0);
#endif
    u_xlat16.xyz = vec3(u_xlat68) * vec3(u_xlat16_74) + u_xlat16.xyz;
    u_xlat16_74 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat16_74 = u_xlat16_74 * u_xlat16_74;
    u_xlat16_74 = max(u_xlat16_74, 0.0078125);
    u_xlat71 = (-u_xlat46.x) * u_xlat16_74 + u_xlat46.x;
    u_xlat71 = u_xlat46.x * u_xlat71 + u_xlat16_74;
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat46.x + u_xlat71;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat51 = (-u_xlat9.x) * u_xlat16_74 + u_xlat9.x;
    u_xlat51 = u_xlat9.x * u_xlat51 + u_xlat16_74;
    u_xlat51 = sqrt(u_xlat51);
    u_xlat51 = u_xlat51 + u_xlat9.x;
    u_xlat51 = u_xlat51 + 6.10351563e-05;
    u_xlat71 = u_xlat71 * u_xlat51;
    u_xlat71 = float(1.0) / u_xlat71;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = u_xlat16_74 + -1.0;
    u_xlat67 = u_xlat67 * u_xlat72 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_74 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat67 = u_xlat71 * u_xlat67;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat67);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = u_xlat46.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_11.xyz = (-u_xlat16.xyz) * u_xlat16_28.xyz + u_xlat16_11.xyz;
    u_xlat16.xyz = u_xlat16_28.xyz * u_xlat16.xyz;
    u_xlat16_10.xw = texture(_MergeTex00, vs_TEXCOORD3.xy).yz;
    u_xlat16_11.xyz = u_xlat16_10.www * u_xlat16_11.xyz + u_xlat16.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16.xyz;
    u_xlat16_75 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_17.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_77 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_76;
    u_xlat16_17.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16.xyz = u_xlat5.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat67 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat16.xyz = vec3(u_xlat67) * u_xlat16.xyz;
    u_xlat16_75 = dot(u_xlat16_15.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat72 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_74 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat71 = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat71 = min(max(u_xlat71, 0.0), 1.0);
#else
    u_xlat71 = clamp(u_xlat71, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat73 * u_xlat73;
    u_xlat16_75 = u_xlat73 * u_xlat16_75;
    u_xlat16_75 = u_xlat73 * u_xlat16_75;
    u_xlat16_76 = u_xlat73 * u_xlat16_75;
    u_xlat73 = (-u_xlat16_75) * u_xlat73 + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * vec3(u_xlat73);
    u_xlat16.xyz = vec3(u_xlat68) * vec3(u_xlat16_76) + u_xlat16.xyz;
    u_xlat73 = (-u_xlat71) * u_xlat16_74 + u_xlat71;
    u_xlat73 = u_xlat71 * u_xlat73 + u_xlat16_74;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat71 + u_xlat73;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat73 = u_xlat51 * u_xlat73;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat67 = u_xlat67 * u_xlat73;
    u_xlat16.xyz = u_xlat16.xyz * vec3(u_xlat67);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.xyz = min(max(u_xlat16.xyz, 0.0), 1.0);
#else
    u_xlat16.xyz = clamp(u_xlat16.xyz, 0.0, 1.0);
#endif
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor.xyz;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16_17.xyz * u_xlat16.xyz;
    u_xlat16_11.xyz = u_xlat16.xyz * u_xlat24.xxx + u_xlat16_11.xyz;
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_75 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16_75 = max(u_xlat16_75, 6.10351563e-05);
    u_xlat16_76 = u_xlat16_75 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_76 = (-u_xlat16_76) * u_xlat16_76 + 1.0;
    u_xlat16_76 = max(u_xlat16_76, 0.0);
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
    u_xlat16_77 = float(1.0) / float(u_xlat16_75);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_15.xyz = vec3(u_xlat16_75) * u_xlat16.xyz;
    u_xlat16_75 = u_xlat16_76 * u_xlat16_77;
    u_xlat16_76 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.00100000005>=abs(u_xlat16_76));
#else
    u_xlatb67 = 0.00100000005>=abs(u_xlat16_76);
#endif
    u_xlat16_18.xy = (bool(u_xlatb67)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_75 = max(u_xlat16_75, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_76 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_76 = u_xlat16_76 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_76 = min(max(u_xlat16_76, 0.0), 1.0);
#else
    u_xlat16_76 = clamp(u_xlat16_76, 0.0, 1.0);
#endif
    u_xlat16_76 = u_xlat16_76 * u_xlat16_76;
#ifdef UNITY_ADRENO_ES3
    u_xlatb67 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb67 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_77 = (u_xlatb67) ? 1.0 : 0.0;
    u_xlat16_76 = max(u_xlat16_76, u_xlat16_77);
    u_xlat16_75 = u_xlat16_75 * u_xlat16_76;
    u_xlat16_18.xyz = vec3(u_xlat16_75) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_7.xxx + u_xlat16_15.xyz;
    u_xlat67 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat5.xyz = vec3(u_xlat67) * u_xlat5.xyz;
    u_xlat67 = dot(u_xlat8.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat16_7.x = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat26.x = (-u_xlat16_7.x) + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat72 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat16_74 / u_xlat67;
    u_xlat67 = u_xlat67 * 0.318309873;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat47 = (-u_xlat5.x) * u_xlat16_74 + u_xlat5.x;
    u_xlat47 = u_xlat5.x * u_xlat47 + u_xlat16_74;
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat5.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat47 = u_xlat47 * u_xlat51;
    u_xlat47 = float(1.0) / u_xlat47;
    u_xlat47 = min(u_xlat47, 16.0);
    u_xlat67 = u_xlat67 * u_xlat47;
    u_xlat16_7.x = u_xlat26.x * u_xlat26.x;
    u_xlat16_7.x = u_xlat26.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat26.x * u_xlat16_7.x;
    u_xlat16_75 = u_xlat26.x * u_xlat16_7.x;
    u_xlat26.x = (-u_xlat16_7.x) * u_xlat26.x + 1.0;
    u_xlat16.xyz = u_xlat16_14.xyz * u_xlat26.xxx;
    u_xlat26.xyz = vec3(u_xlat68) * vec3(u_xlat16_75) + u_xlat16.xyz;
    u_xlat26.xyz = vec3(u_xlat67) * u_xlat26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat26.xyz * _directSpecularColor.xyz;
    u_xlat26.xyz = u_xlat5.xxx * u_xlat26.xyz;
    u_xlat26.xyz = u_xlat16_18.xyz * u_xlat26.xyz;
    u_xlat16_11.xyz = u_xlat26.xyz * u_xlat24.yyy + u_xlat16_11.xyz;
    u_xlat16_7.x = (-u_xlat16_10.y) * _metallicMultiplier + 1.0;
    u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_28.xyz * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat16_17.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat24.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat71) * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat46.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat24.yyy * u_xlat16_15.xyz;
    u_xlat16_7.xyz = u_xlat16_15.xyz * u_xlat5.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz + u_xlat16_7.xyz;
    u_xlat16_15.xyz = (-u_xlat6.xyz) * vec3(u_xlat69) + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat8.xyz;
    u_xlat16_70 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_70 = inversesqrt(u_xlat16_70);
    u_xlat16_17.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
    u_xlat16_70 = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_70 * 0.5 + 0.5;
    u_xlat16_75 = (-u_xlat16_70) + u_xlat16_75;
    u_xlat16_76 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_76 + 1.0;
    u_xlat16_70 = u_xlat16_2.w * u_xlat16_75 + u_xlat16_70;
    u_xlat16_70 = u_xlat16_2.w * u_xlat16_70;
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_70 = u_xlat16_70 * u_xlat16_75;
    u_xlat4.xy = min(u_xlat4.xy, vec2(u_xlat16_70));
    u_xlat4.x = min(u_xlat4.x, u_xlat16_10.z);
    u_xlat16_18.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat4.xxx * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_19.xyz = u_xlat4.xxx * u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat4.xxx + (-u_xlat16_19.xyz);
    u_xlat16_19.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_19.xyz * u_xlat4.xxx + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_19.y = u_xlat16_17.y;
    u_xlat16_20.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati4.xzw = ivec3(uvec3(lessThan(u_xlat16_19.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_20.xyz;
    u_xlati46 = int(int_bitfieldInsert(2,u_xlati4.z,0,1) );
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati46].xyz;
    u_xlati4.x = int(uint(uint(u_xlati4.x) & 1u));
    u_xlati46 = (u_xlati4.w != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati4.x].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati46].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_7.xyz = u_xlat16_13.xyz * u_xlat16_18.xyz + u_xlat16_7.xyz;
    u_xlat16_13.x = dot((-u_xlat16_12.xyz), u_xlat8.xyz);
    u_xlat16_13.x = u_xlat16_13.x + u_xlat16_13.x;
    u_xlat4.xzw = (-u_xlat8.xyz) * u_xlat16_13.xxx + (-u_xlat16_12.xyz);
    u_xlat5.x = dot(u_xlat16_17.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_17.xyz, u_xlat4.xzw);
    u_xlat16_13.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_13.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_13.x = floor(u_xlat16_3.w);
    u_xlat16_34.x = u_xlat16_13.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_3.x = u_xlat16_34.x * 16.0 + u_xlat16_3.z;
    u_xlat16_34.xz = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_26 = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_3.x = u_xlat16_13.x * 16.0 + u_xlat16_3.z;
    u_xlat16_34.xz = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_47 = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_13.x = u_xlat16_13.z * 15.0 + (-u_xlat16_13.x);
    u_xlat16_34.x = (-u_xlat16_47) + u_xlat16_26;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_34.x + u_xlat16_47;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_13.x;
    u_xlat5.x = u_xlat5.x * u_xlat16_75;
    u_xlat16_75 = u_xlat4.y * 0.5;
    u_xlat16_13.x = (-u_xlat4.y) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat5.x * u_xlat16_13.x + u_xlat16_75;
    u_xlat16_13.x = u_xlat16_75 + u_xlat16_75;
    u_xlat16_34.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_34.x + u_xlat16_13.x;
    u_xlat16_75 = u_xlat4.y * u_xlat16_75;
    u_xlat16_75 = min(u_xlat16_10.z, u_xlat16_75);
    u_xlat5.xyz = u_xlat6.xyz * vec3(u_xlat69) + (-u_xlat4.xzw);
    u_xlat4.xyz = vec3(u_xlat16_74) * u_xlat5.xyz + u_xlat4.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat13.y = u_xlat4.y;
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_74 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat9.y = u_xlat16_2.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_74);
    u_xlat16_17.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_17.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_17.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_18.xyz = vec3(u_xlat16_70) * u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb4 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_17.xyz = (bool(u_xlatb4)) ? u_xlat16_18.xyz : u_xlat16_17.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_75) * u_xlat16_14.xyz;
    u_xlat16_17.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17.xyz = min(max(u_xlat16_17.xyz, 0.0), 1.0);
#else
    u_xlat16_17.xyz = clamp(u_xlat16_17.xyz, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_7.xyz;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_17.xyz + u_xlat16_11.xyz;
    u_xlat16_70 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_0.w * _albedoColor.w + u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_11.x = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_4.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_14.xyz = u_xlat16_32.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_32.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_14.xyz + u_xlat16_7.xyz;
    u_xlat4.xy = u_xlat16_12.yy * vs_TEXCOORD8.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_12.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD9.xy * u_xlat16_12.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_32.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat4.xy * u_xlat16_32.xx;
    u_xlat16_4.x = texture(_MergeTex00, u_xlat4.xy).x;
    u_xlat25.xy = vs_TEXCOORD3.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_25 = texture(_MergeTex00, u_xlat25.xy).x;
    u_xlat16_32.x = u_xlat16_4.x * u_xlat16_25;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.x = min(max(u_xlat16_32.x, 0.0), 1.0);
#else
    u_xlat16_32.x = clamp(u_xlat16_32.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_32.x * _GlitterIntensity;
    u_xlat4.x = max(u_xlat16_32.x, 0.00100000005);
    u_xlat4.x = log2(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * _GlitterContrast;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.xyz = u_xlat4.xxx * _GlitterColor.xyz;
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_10.xxx + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb4 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_32.xy = (bool(u_xlatb4)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_12.xy = (bool(u_xlatb4)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_32.xy = u_xlat16_32.xy + u_xlat16_12.xy;
    u_xlat16_32.xy = u_xlat16_32.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat4.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_32.xy;
    u_xlat16_4.xyz = texture(_FlowLightTex, u_xlat4.xy).xyz;
    u_xlat16_32.xyz = u_xlat16_4.xyz * _FlowLightUpColor.xyz;
    u_xlat16_12.x = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_32.xyz = u_xlat16_32.xyz * u_xlat16_12.xxx;
    u_xlat16_4.x = texture(_MergeTex01, vs_TEXCOORD3.xy).y;
    u_xlat16_7.xyz = u_xlat16_32.xyz * u_xlat16_4.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_22.xxx + u_xlat16_7.xyz;
    u_xlat16_7.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb4 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb4) ? u_xlat16_70 : u_xlat16_11.x;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 102855
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_FlowLight_Glitter_ButtonColorChang_DissolveGUI"
}