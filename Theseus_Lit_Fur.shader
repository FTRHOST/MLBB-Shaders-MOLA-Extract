//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/Fur" {
Properties {

[Space(15)] [Header(Texture(2D)________________________________________________________________________)] [Space(5)] _cull ("剔除模式", Float) = 2.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 56721
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
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
UNITY_LOCATION(1) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
ivec3 u_xlati3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
int u_xlati16;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_25 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3 = inversesqrt(u_xlat3);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat3);
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_2.w = (-u_xlat16_26) + 1.0;
    u_xlat16_2 = u_xlat16_2 * vec4(0.318309873, 0.318309873, 0.318309873, 1.04166663);
    u_xlat16_26 = max(u_xlat16_2.w, 0.0);
    u_xlat16_4.x = u_xlat16_26 * -2.0 + 3.0;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * u_xlat16_4.x;
    u_xlat16_26 = u_xlat16_26 * 0.999899983;
    u_xlat16_26 = min(u_xlat16_26, 1.0);
    u_xlat16_4.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_26) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_5.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_5.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_5.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_5.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_5.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_6.xyz = u_xlat16_5.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlat16_5.xyw = u_xlat16_5.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_6.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_5.xyz = u_xlat16_5.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_5.xyw;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_7.xyz);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _localDiffuseGI.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_26 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_26 = u_xlat16_0.w * _albedoColor.w + u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_26 : u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat8) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_25 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_25) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_25) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
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
uniform 	vec4 _LayerTex_ST;
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
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
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
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    vs_TEXCOORD2 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.xy = in_TEXCOORD0.xy * _LayerTex_ST.xy + _LayerTex_ST.zw;
    vs_TEXCOORD3.zw = u_xlat0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _shadowColor;
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
UNITY_LOCATION(3) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec3 u_xlati3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
float u_xlat12;
mediump float u_xlat16_14;
vec3 u_xlat15;
float u_xlat16;
int u_xlati24;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_44;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _albedoColor.xyz;
    u_xlat16_37 = u_xlat16_0.w * _albedoColor.w;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb3 = _ShadowBias.z!=0.0;
#endif
    u_xlat15.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat4.x = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat4.xxx;
    u_xlat15.x = dot(vs_TEXCOORD1.xyz, u_xlat15.xyz);
    u_xlat15.x = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat15.x = sqrt(u_xlat15.x);
    u_xlat15.x = u_xlat15.x * _ShadowBias.z;
    u_xlat15.xyz = (-vs_TEXCOORD1.xyz) * u_xlat15.xxx + vs_TEXCOORD0.xyz;
    u_xlat3.xyz = (bool(u_xlatb3)) ? u_xlat15.xyz : vs_TEXCOORD0.xyz;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat7;
    u_xlat5 = u_xlat3.yyyy * u_xlat5;
    u_xlat4 = u_xlat4 * u_xlat3.xxxx + u_xlat5;
    u_xlat3 = u_xlat6 * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat7 + u_xlat3;
    u_xlat4.x = _ShadowBias.x / u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat3.z + (-u_xlat4.x);
    u_xlat16 = max((-u_xlat3.w), u_xlat4.x);
    u_xlat16 = (-u_xlat4.x) + u_xlat16;
    u_xlat3.z = _ShadowBias.y * u_xlat16 + u_xlat4.x;
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat3.w = max(u_xlat3.z, 9.99999975e-05);
    u_xlat16_14 = (-_ShadowBias.w) + 1.0;
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat3.xyw + u_xlat4.xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat5.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec2 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat5.z = 0.0;
    u_xlat3.xyz = u_xlat3.xyw + u_xlat5.xyz;
    vec3 txVec3 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat3.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat15.x = (-u_xlat16_14) + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat15.x + u_xlat16_14;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat15.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat15.xxx;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = dot(vs_TEXCOORD1.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat3.xxx * u_xlat16_2.xyz + _shadowColor.xyz;
    u_xlat16_8.xyz = u_xlat16_1.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_8.xyz = u_xlat16_2.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_38 = (-u_xlat0.x) * u_xlat0.x + 1.03999996;
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    u_xlat16_38 = u_xlat16_38 * 1.04166663;
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_44 = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_44;
    u_xlat16_38 = u_xlat16_38 * 0.999899983;
    u_xlat16_38 = min(u_xlat16_38, 1.0);
    u_xlat16_9.xyz = _MainLightIntensityAndAngleScale.xyz * _directSpecularColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, vs_TEXCOORD1.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, vs_TEXCOORD1.xz);
    u_xlat16_9.y = vs_TEXCOORD1.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati0 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati24 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_10.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati24].xyz;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_10.xyz;
    u_xlati0 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_9.xyw;
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_10.xyz = u_xlat16_10.xyz + (-u_xlat16_11.xyz);
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_38 = u_xlat16_0.w * _albedoColor.w + u_xlat16_38;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_38 : u_xlat16_37;
    u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat12) + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_9.xyz * u_xlat16_1.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_37 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_2.xyz = vec3(u_xlat16_37) * vec3(_Crystal_CustomColor_R_Color.x, _Crystal_CustomColor_R_Color.y, _Crystal_CustomColor_R_Color.z) + (-u_xlat16_1.xyz);
        u_xlat16_2.xyz = u_xlat16_0.xxx * u_xlat16_2.xyz + u_xlat16_1.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_2.xyz = u_xlat16_0.yyy * u_xlat16_8.xyz + u_xlat16_2.xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_2.xyz);
        SV_Target0.xyz = u_xlat16_0.zzz * u_xlat16_8.xyz + u_xlat16_2.xyz;
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
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 93040
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_FurGUI"
}