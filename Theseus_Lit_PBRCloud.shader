//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Cloud)" {
Properties {

_cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_DiffXSpeed ("基础色贴图流动速度X", Float) = 0.0

_DiffYSpeed ("基础色贴图流动速度Y", Float) = 0.0

[Tex] _materialParamsMap ("_materialParamsMap", 2D) = "white" { }

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 0.699999988079071

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _normalMap ("normalMap", 2D) = "bump" { }

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

_WaveSpeed ("波动速度", Range(0, 10)) = 2.0

_WaveAmplitude ("波动强度", Range(0, 0.5)) = 0.15000000596046448

_WaveFrequency ("波动频率", Range(1, 20)) = 8.0

_PivotPoint ("中心锚点", Vector) = (0,0,0,1)

_PivotStrength ("锚点强度", Range(1, 20)) = 5.0

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 54654
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
int u_xlati12;
int u_xlati24;
mediump float u_xlat16_27;
float u_xlat36;
mediump float u_xlat16_37;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_39) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat8.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_39 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_39) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39 = (-u_xlat38) * u_xlat38 + 1.03999996;
    u_xlat16_39 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_39 = u_xlat16_39 / u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_39) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati24 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_27 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati12 = int(int_bitfieldInsert(2,u_xlati24,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_27) * _IrradianceACCoeffs[u_xlati12].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_11.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_39 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_39 = u_xlat16_0.w * _albedoColor.w + u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_39 : u_xlat16_37;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat0.xyz = u_xlat16_1.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat12.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
int u_xlati12;
int u_xlati24;
mediump float u_xlat16_27;
float u_xlat36;
mediump float u_xlat16_37;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_39) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat8.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_39 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_39) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39 = (-u_xlat38) * u_xlat38 + 1.03999996;
    u_xlat16_39 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_39 = u_xlat16_39 / u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_39) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati24 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_27 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati12 = int(int_bitfieldInsert(2,u_xlati24,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_27) * _IrradianceACCoeffs[u_xlati12].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_11.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_39 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_39 = u_xlat16_0.w * _albedoColor.w + u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_39 : u_xlat16_37;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat0.xyz = u_xlat16_1.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat12.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(6) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(7) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
int u_xlati15;
float u_xlat23;
int u_xlati30;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
float u_xlat45;
mediump float u_xlat16_46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat53;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_46 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_48 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_47 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_49 = u_xlat16_47 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb47 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat9.xyz;
    u_xlat53 = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat53 = (-u_xlat53) * u_xlat53 + 1.0;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb47)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat7;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat11;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat12;
    u_xlat10 = u_xlat9.yyyy * u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat9.xxxx + u_xlat10;
    u_xlat7 = u_xlat11 * u_xlat9.zzzz + u_xlat7;
    u_xlat7 = u_xlat12 + u_xlat7;
    u_xlat47 = _ShadowBias.x / u_xlat7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat47) + u_xlat7.z;
    u_xlat53 = max((-u_xlat7.w), u_xlat47);
    u_xlat53 = (-u_xlat47) + u_xlat53;
    u_xlat7.z = _ShadowBias.y * u_xlat53 + u_xlat47;
    u_xlat9.xyz = u_xlat7.xyz / u_xlat7.www;
    u_xlat7.xyz = u_xlat9.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat7.w = max(u_xlat7.z, 9.99999975e-05);
    u_xlat16_35 = (-_ShadowBias.w) + 1.0;
    u_xlat9.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat9.z = 0.0;
    u_xlat9.xyz = u_xlat7.xyw + u_xlat9.xyz;
    vec3 txVec0 = vec3(u_xlat9.xy,u_xlat9.z);
    u_xlat9.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec1 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec2 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec3 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat47 = dot(u_xlat9, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat47 = u_xlat47 * u_xlat53 + u_xlat16_35;
    u_xlat47 = (-u_xlat47) + 1.0;
    u_xlat47 = (-u_xlat47) * u_xlat16_49 + 1.0;
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_48) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat53 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat8.xyz = vec3(u_xlat53) * u_xlat8.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat47) * u_xlat16_13.xyz + _shadowColor.xyz;
    u_xlat16_48 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_48) * u_xlat16_4.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = (-u_xlat8.x) * u_xlat8.x + 1.03999996;
    u_xlat16_48 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_48);
    u_xlat16_48 = u_xlat16_48 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * -2.0 + 3.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_48 = u_xlat16_48 / u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_48) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati30 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_33 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati15 = int(int_bitfieldInsert(2,u_xlati30,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _IrradianceACCoeffs[u_xlati15].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_48 = u_xlat16_0.w * _albedoColor.w + u_xlat16_48;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_48 : u_xlat16_46;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(u_xlat23) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_46 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat0.xyz = u_xlat16_1.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat45 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat45 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat15.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat15.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat15.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat15.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(6) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(7) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
int u_xlati15;
float u_xlat23;
int u_xlati30;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
float u_xlat45;
mediump float u_xlat16_46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat53;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_46 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_48 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_47 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_49 = u_xlat16_47 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb47 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat9.xyz;
    u_xlat53 = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat53 = (-u_xlat53) * u_xlat53 + 1.0;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb47)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat7;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat11;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat12;
    u_xlat10 = u_xlat9.yyyy * u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat9.xxxx + u_xlat10;
    u_xlat7 = u_xlat11 * u_xlat9.zzzz + u_xlat7;
    u_xlat7 = u_xlat12 + u_xlat7;
    u_xlat47 = _ShadowBias.x / u_xlat7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat47) + u_xlat7.z;
    u_xlat53 = max((-u_xlat7.w), u_xlat47);
    u_xlat53 = (-u_xlat47) + u_xlat53;
    u_xlat7.z = _ShadowBias.y * u_xlat53 + u_xlat47;
    u_xlat9.xyz = u_xlat7.xyz / u_xlat7.www;
    u_xlat7.xyz = u_xlat9.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat7.w = max(u_xlat7.z, 9.99999975e-05);
    u_xlat16_35 = (-_ShadowBias.w) + 1.0;
    u_xlat9.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat9.z = 0.0;
    u_xlat9.xyz = u_xlat7.xyw + u_xlat9.xyz;
    vec3 txVec0 = vec3(u_xlat9.xy,u_xlat9.z);
    u_xlat9.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec1 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec2 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec3 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat47 = dot(u_xlat9, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat47 = u_xlat47 * u_xlat53 + u_xlat16_35;
    u_xlat47 = (-u_xlat47) + 1.0;
    u_xlat47 = (-u_xlat47) * u_xlat16_49 + 1.0;
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_48) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat53 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat8.xyz = vec3(u_xlat53) * u_xlat8.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat47) * u_xlat16_13.xyz + _shadowColor.xyz;
    u_xlat16_48 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_48) * u_xlat16_4.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = (-u_xlat8.x) * u_xlat8.x + 1.03999996;
    u_xlat16_48 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_48);
    u_xlat16_48 = u_xlat16_48 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * -2.0 + 3.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_48 = u_xlat16_48 / u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_48) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati30 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_33 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati15 = int(int_bitfieldInsert(2,u_xlati30,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _IrradianceACCoeffs[u_xlati15].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_48 = u_xlat16_0.w * _albedoColor.w + u_xlat16_48;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_48 : u_xlat16_46;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(u_xlat23) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_46 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat0.xyz = u_xlat16_1.zxy * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat45 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat45 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat15.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat15.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat45);
    u_xlat15.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat15.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
int u_xlati12;
int u_xlati24;
mediump float u_xlat16_27;
mediump float u_xlat16_37;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_39) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat8.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_39 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_39) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39 = (-u_xlat38) * u_xlat38 + 1.03999996;
    u_xlat16_39 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_39 = u_xlat16_39 / u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_39) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati24 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_27 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati12 = int(int_bitfieldInsert(2,u_xlati24,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_27) * _IrradianceACCoeffs[u_xlati12].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_11.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_39 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_39 = u_xlat16_0.w * _albedoColor.w + u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_39 : u_xlat16_37;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
int u_xlati12;
int u_xlati24;
mediump float u_xlat16_27;
mediump float u_xlat16_37;
float u_xlat38;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_39 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_39 = inversesqrt(u_xlat16_39);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_39) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat38 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat8.xyz = vec3(u_xlat38) * u_xlat8.xyz;
    u_xlat38 = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat8.x = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_39 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_39) * u_xlat16_4.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_39 = (-u_xlat38) * u_xlat38 + 1.03999996;
    u_xlat16_39 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_39);
    u_xlat16_39 = u_xlat16_39 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_39 * -2.0 + 3.0;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_39;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_40;
    u_xlat16_40 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_40 = u_xlat16_40 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_39 = u_xlat16_39 / u_xlat16_40;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_39) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati24 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati24 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_27 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati12 = int(int_bitfieldInsert(2,u_xlati24,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_27) * _IrradianceACCoeffs[u_xlati12].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_2.zzz * u_xlat16_11.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_11.xyz);
    u_xlat16_11.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_11.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_39 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_39 = u_xlat16_0.w * _albedoColor.w + u_xlat16_39;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39 = min(max(u_xlat16_39, 0.0), 1.0);
#else
    u_xlat16_39 = clamp(u_xlat16_39, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_39 : u_xlat16_37;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat8.xxx + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(6) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
int u_xlati15;
float u_xlat23;
int u_xlati30;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
mediump float u_xlat16_46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat53;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_46 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_48 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_47 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_49 = u_xlat16_47 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb47 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat9.xyz;
    u_xlat53 = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat53 = (-u_xlat53) * u_xlat53 + 1.0;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb47)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat7;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat11;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat12;
    u_xlat10 = u_xlat9.yyyy * u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat9.xxxx + u_xlat10;
    u_xlat7 = u_xlat11 * u_xlat9.zzzz + u_xlat7;
    u_xlat7 = u_xlat12 + u_xlat7;
    u_xlat47 = _ShadowBias.x / u_xlat7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat47) + u_xlat7.z;
    u_xlat53 = max((-u_xlat7.w), u_xlat47);
    u_xlat53 = (-u_xlat47) + u_xlat53;
    u_xlat7.z = _ShadowBias.y * u_xlat53 + u_xlat47;
    u_xlat9.xyz = u_xlat7.xyz / u_xlat7.www;
    u_xlat7.xyz = u_xlat9.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat7.w = max(u_xlat7.z, 9.99999975e-05);
    u_xlat16_35 = (-_ShadowBias.w) + 1.0;
    u_xlat9.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat9.z = 0.0;
    u_xlat9.xyz = u_xlat7.xyw + u_xlat9.xyz;
    vec3 txVec0 = vec3(u_xlat9.xy,u_xlat9.z);
    u_xlat9.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec1 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec2 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec3 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat47 = dot(u_xlat9, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat47 = u_xlat47 * u_xlat53 + u_xlat16_35;
    u_xlat47 = (-u_xlat47) + 1.0;
    u_xlat47 = (-u_xlat47) * u_xlat16_49 + 1.0;
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_48) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat53 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat8.xyz = vec3(u_xlat53) * u_xlat8.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat47) * u_xlat16_13.xyz + _shadowColor.xyz;
    u_xlat16_48 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_48) * u_xlat16_4.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = (-u_xlat8.x) * u_xlat8.x + 1.03999996;
    u_xlat16_48 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_48);
    u_xlat16_48 = u_xlat16_48 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * -2.0 + 3.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_48 = u_xlat16_48 / u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_48) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati30 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_33 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati15 = int(int_bitfieldInsert(2,u_xlati30,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _IrradianceACCoeffs[u_xlati15].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_48 = u_xlat16_0.w * _albedoColor.w + u_xlat16_48;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_48 : u_xlat16_46;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(u_xlat23) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_46 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	mediump float _WaveSpeed;
uniform 	mediump float _WaveAmplitude;
uniform 	mediump float _WaveFrequency;
uniform 	mediump vec3 _PivotPoint;
uniform 	mediump float _PivotStrength;
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
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_PivotPoint.xyz);
    u_xlat16_1 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1 = u_xlat16_1 * _PivotStrength;
    u_xlat16_1 = u_xlat16_1 * 0.100000001 + 1.0;
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_1) + 1.0;
    u_xlat0.x = _WaveSpeed * _Time.y;
    u_xlat0.x = in_POSITION0.x * _WaveFrequency + u_xlat0.x;
    u_xlat16_4 = sin(u_xlat0.x);
    u_xlat16_4 = u_xlat16_4 * 0.5 + 0.5;
    u_xlat16_4 = u_xlat16_4 * _WaveAmplitude;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(u_xlat16_1) + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD0.w = 0.0;
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
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	vec4 _albedoMap_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	float _DiffXSpeed;
uniform 	float _DiffYSpeed;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(3) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(6) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
int u_xlati15;
float u_xlat23;
int u_xlati30;
mediump float u_xlat16_33;
mediump float u_xlat16_35;
mediump float u_xlat16_46;
float u_xlat47;
mediump float u_xlat16_47;
bool u_xlatb47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat53;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xy = vs_TEXCOORD3.xy * _albedoMap_ST.xy + _albedoMap_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_DiffXSpeed, _DiffYSpeed) + u_xlat0.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_46 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_48 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_48) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_48 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_48 = inversesqrt(u_xlat16_48);
    u_xlat16_6.xyz = _emissiveColor.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_47 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_49 = u_xlat16_47 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlatb47 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb47 = _ShadowBias.z!=0.0;
#endif
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat53 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat9.xyz;
    u_xlat53 = dot(u_xlat0.xyz, u_xlat9.xyz);
    u_xlat53 = (-u_xlat53) * u_xlat53 + 1.0;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat53 * _ShadowBias.z;
    u_xlat9.xyz = (-u_xlat0.xyz) * vec3(u_xlat53) + vs_TEXCOORD0.xyz;
    u_xlat9.xyz = (bool(u_xlatb47)) ? u_xlat9.xyz : vs_TEXCOORD0.xyz;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat7;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat10;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat11;
    u_xlat11 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat11;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat12;
    u_xlat10 = u_xlat9.yyyy * u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat9.xxxx + u_xlat10;
    u_xlat7 = u_xlat11 * u_xlat9.zzzz + u_xlat7;
    u_xlat7 = u_xlat12 + u_xlat7;
    u_xlat47 = _ShadowBias.x / u_xlat7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat47 = min(max(u_xlat47, 0.0), 1.0);
#else
    u_xlat47 = clamp(u_xlat47, 0.0, 1.0);
#endif
    u_xlat47 = (-u_xlat47) + u_xlat7.z;
    u_xlat53 = max((-u_xlat7.w), u_xlat47);
    u_xlat53 = (-u_xlat47) + u_xlat53;
    u_xlat7.z = _ShadowBias.y * u_xlat53 + u_xlat47;
    u_xlat9.xyz = u_xlat7.xyz / u_xlat7.www;
    u_xlat7.xyz = u_xlat9.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat7.w = max(u_xlat7.z, 9.99999975e-05);
    u_xlat16_35 = (-_ShadowBias.w) + 1.0;
    u_xlat9.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat9.z = 0.0;
    u_xlat9.xyz = u_xlat7.xyw + u_xlat9.xyz;
    vec3 txVec0 = vec3(u_xlat9.xy,u_xlat9.z);
    u_xlat9.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec1 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec2 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat10.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat10.z = 0.0;
    u_xlat10.xyz = u_xlat7.xyw + u_xlat10.xyz;
    vec3 txVec3 = vec3(u_xlat10.xy,u_xlat10.z);
    u_xlat9.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat47 = dot(u_xlat9, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat53 = (-u_xlat16_35) + 1.0;
    u_xlat47 = u_xlat47 * u_xlat53 + u_xlat16_35;
    u_xlat47 = (-u_xlat47) + 1.0;
    u_xlat47 = (-u_xlat47) * u_xlat16_49 + 1.0;
    u_xlat47 = max(u_xlat47, 0.0);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_48) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat53 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat8.xyz = vec3(u_xlat53) * u_xlat8.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat23 = dot(u_xlat0.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat16_13.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat47) * u_xlat16_13.xyz + _shadowColor.xyz;
    u_xlat16_48 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_48) * u_xlat16_4.xyz;
    u_xlat16_14.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = (-u_xlat8.x) * u_xlat8.x + 1.03999996;
    u_xlat16_48 = u_xlat16_2.x * _roughnessMultiplier + (-u_xlat16_48);
    u_xlat16_48 = u_xlat16_48 * 1.04166663;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_48 * -2.0 + 3.0;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_48;
    u_xlat16_48 = u_xlat16_48 * u_xlat16_49;
    u_xlat16_49 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_49 = u_xlat16_49 * u_xlat16_5.x + 9.99999975e-05;
    u_xlat16_48 = u_xlat16_48 / u_xlat16_49;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * _directSpecularColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_48) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_3.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat0.xz);
    u_xlat16_3.y = dot(_IndirectSpecularMapRotationParams.zw, u_xlat0.xz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.y<0.0; u_xlati30 = int(!!cond ? 0xFFFFFFFFu : uint(0)); }
#else
    u_xlati30 = int((u_xlat0.y<0.0) ? 0xFFFFFFFFu : uint(0));
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.y<0.0);
#else
    u_xlatb2 = u_xlat16_3.y<0.0;
#endif
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_33 = u_xlat0.y * u_xlat0.y;
    u_xlat16_3.xy = u_xlat16_3.xy * u_xlat16_3.xy;
    u_xlati15 = int(int_bitfieldInsert(2,u_xlati30,0,1) );
    u_xlat16_5.xyz = vec3(u_xlat16_33) * _IrradianceACCoeffs[u_xlati15].xyz;
    u_xlat16_3.xzw = u_xlat16_3.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb2) ? 5 : 4;
    u_xlat16_3.xyz = u_xlat16_3.yyy * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_3.xzw;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_2.zzz * u_xlat16_5.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.zzz * u_xlat16_13.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_2.zzz + (-u_xlat16_13.xyz);
    u_xlat16_13.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_5.xyz = u_xlat16_13.xyz * u_xlat16_2.zzz + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _localDiffuseGI.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_48 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_48 = u_xlat16_0.w * _albedoColor.w + u_xlat16_48;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_48 = min(max(u_xlat16_48, 0.0), 1.0);
#else
    u_xlat16_48 = clamp(u_xlat16_48, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_48 : u_xlat16_46;
    u_xlat16_1.xyz = u_xlat16_14.xyz * vec3(u_xlat23) + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = _emissiveColor.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_46 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_46) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 127284
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
CustomEditor "CodeGenShaderGUI.Theseus_PBR_CloudGUI"
}