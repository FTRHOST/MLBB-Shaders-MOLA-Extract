//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Common)_Simple" {
Properties {

_cull ("剔除模式", Float) = 2.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColorSimple ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplierSimple ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplierSimple ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColorSimple ("自发光颜色", Color) = (0,0,0,1)

_directSpecularColorSimple ("直接光高光颜色", Color) = (1,1,1,1)

_indirectDiffuseColorSimple ("间接光漫反射颜色", Color) = (1,1,1,1)

[Toggle] _Crystal_UseCustomColor ("Use Custom Color", Float) = 0.0

_Crystal_CustomColorMask ("Custom Color Mask", 2D) = "black" { }

_Crystal_CustomColor_R_Color ("R Color", Color) = (1,1,1,1)

_Crystal_CustomColor_G_Color ("G Color", Color) = (1,1,1,1)

_Crystal_CustomColor_B_Color ("B Color", Color) = (1,1,1,1)

}
SubShader {
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 3181
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.00100000005);
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + -2.0;
    u_xlat12.x = max(u_xlat12.x, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12.x * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12.x + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat12.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.00100000005);
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + -2.0;
    u_xlat12.x = max(u_xlat12.x, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12.x * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12.x + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat12.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.00100000005);
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + -2.0;
    u_xlat12.x = max(u_xlat12.x, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12.x * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12.x + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat12.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(5) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = u_xlat16_5.x * u_xlat12.x;
    u_xlat12.x = max(u_xlat12.x, 0.00100000005);
    u_xlat12.x = 2.0 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + -2.0;
    u_xlat12.x = max(u_xlat12.x, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12.x * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12.x + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat12.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat12.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat12.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat12.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = 2.0 / u_xlat12;
    u_xlat12 = u_xlat12 + -2.0;
    u_xlat12 = max(u_xlat12, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12 * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12 + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = 2.0 / u_xlat12;
    u_xlat12 = u_xlat12 + -2.0;
    u_xlat12 = max(u_xlat12, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12 * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12 + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = 2.0 / u_xlat12;
    u_xlat12 = u_xlat12 + -2.0;
    u_xlat12 = max(u_xlat12, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12 * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12 + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColorSimple;
uniform 	mediump vec4 _emissiveColorSimple;
uniform 	mediump vec4 _directSpecularColorSimple;
uniform 	mediump vec4 _indirectDiffuseColorSimple;
uniform 	mediump float _metallicMultiplierSimple;
uniform 	mediump float _roughnessMultiplierSimple;
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
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_25;
float u_xlat36;
mediump float u_xlat16_37;
mediump float u_xlat16_39;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_5.xy = u_xlat16_4.xy * vec2(_roughnessMultiplierSimple, _metallicMultiplierSimple);
    u_xlat16_6.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_39) + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat16_8.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat6.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat6.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat16_7.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat6.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_7.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat6.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_7.xyz, u_xlat9.xyz);
    u_xlat36 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat10.xyz;
    u_xlat16_9.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * _emissiveColorSimple.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_5.yyy * u_xlat2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat16_4.y) * _metallicMultiplierSimple + 1.0;
    u_xlat9.xyz = vec3(u_xlat36) * u_xlat16_3.xyz;
    u_xlat16_13.xyz = _albedoColorSimple.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyw = u_xlat16_13.xyz * u_xlat9.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_13.xyz = u_xlat0.xxx * u_xlat4.xyw;
    u_xlat6.xyz = u_xlat16_4.zzz * u_xlat16_13.xyz;
    u_xlat12 = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = u_xlat16_5.x * u_xlat12;
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = 2.0 / u_xlat12;
    u_xlat12 = u_xlat12 + -2.0;
    u_xlat12 = max(u_xlat12, 1.0);
    u_xlat16_13.x = log2(u_xlat36);
    u_xlat16_13.x = u_xlat12 * u_xlat16_13.x;
    u_xlat16_13.x = exp2(u_xlat16_13.x);
    u_xlat16_25 = u_xlat12 + 2.0;
    u_xlat16_13.x = u_xlat16_25 * u_xlat16_13.x;
    u_xlat16_13.x = u_xlat16_13.x * 0.159154937;
    u_xlat16_3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25 = u_xlat16_1.x * -5.55472994 + -6.98316002;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_25;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat2.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _directSpecularColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_13.xxx * u_xlat16_1.xzw;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat4.xyw * _indirectDiffuseColorSimple.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.25, 0.25, 0.25) + u_xlat6.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.zzz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
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
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_3.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_37) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
}
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_SimpleGUI"
}