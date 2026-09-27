//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Unlit/WaterFlowLightDissolve" {
Properties {

_Cull ("剔除模式", Float) = 2.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_GrabLuminance ("背景图亮度", Range(0, 20)) = 1.0

_GrabStrength ("背景图强度", Range(0, 1)) = 1.0

_Distortion ("扭曲强度", Range(0, 1)) = 0.10000000149011612

_normalMap ("本体法线贴图", 2D) = "bump" { }

_WarpMap ("水波法线贴图", 2D) = "bump" { }

_WaveIntensity ("水波法线强度", Range(0, 2)) = 1.0

_WaveXSpeed ("水波流动速度", Range(0, 5)) = 1.0

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_MaskTex ("遮罩贴图", 2D) = "white" { }

_FeatureMaskTex ("R:sanshe1遮罩 G:sanshe2遮罩", 2D) = "white" { }

_SANSHE_ON ("散射开关关键字", Float) = 0.0

_Sanshe_color ("散射1颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("散射1范围", Range(0.001, 10)) = 1.0

_Sanshe_Power ("散射1强度", Float) = 0.0

_Sanshe_X ("散射1X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("散射1Y轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_color ("散射2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("散射2范围", Range(0.001, 10)) = 1.0

_Sanshe2_Power ("散射2强度", Float) = 0.0

_Sanshe2_X ("散射2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("散射2Y轴偏移", Range(-1, 1)) = 0.0

_SpecularColor ("高光颜色", Color) = (1,1,1,1)

_SpecularRange ("高光范围", Float) = 1.0

_SpecularIntensity ("高光强度", Float) = 1.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightUpTex ("流光纹理", 2D) = "white" { }

_FlowLightUpPower ("流光纹理对比度", Float) = 0.0

_FlowLightUpColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightUpFactory ("流光参数", Vector) = (0,1,1,1)

_GlitterTex ("闪点贴图", 2D) = "white" { }

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_GlitterFlowSpeed ("闪点流动速度", Range(-5, 5)) = 1.0

_FresnelColor ("菲涅尔颜色", Color) = (0,0,0,0)

_FresnelPower ("菲涅尔范围", Range(0, 100)) = 1.0

_FresnelScale ("菲涅尔强度", Float) = 1.0

_WaterCube ("环境反射Cube", Cube) = "" { }

_CubeColor ("环境反射颜色", Color) = (1,1,1,1)

_CubePower ("环境反射区域范围", Float) = 1.0

_CubeIntensity ("环境反射强度", Range(0, 5)) = 1.0

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("切换溶解方向", Float) = 0.0

_DissolveDirSpeed ("溶解方向速度", Vector) = (1,0,0,0)

_DissolveTex ("溶解纹理", 2D) = "white" { }

_DissolveEdgeColor ("边缘颜色", Color) = (1,1,1,1)

_DissolveShrink ("边缘压缩", Float) = 8.0

_DissolveRange ("边缘范围", Range(0.2, 10)) = 1.0

_Cutoff ("溶解进度", Range(0, 1)) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 GrabPass {
 "_GrabTexture"
}
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 42560
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.zxy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.zxy;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.zxy;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.zxy);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * u_xlat16_4.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.zxy + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.zxy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.zxy;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.zxy;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.zxy);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * u_xlat16_4.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.zxy + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.zxy);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.zxy;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.zxy;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.zxy * u_xlat16_11.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.zxy + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.zxy;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.zxy;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_17.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.zxy);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.zxy;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.zxy;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.zxy * u_xlat16_11.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.zxy + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.zxy;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.zxy;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_17.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_17.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.zxy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.zxy;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.zxy;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.zxy);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * u_xlat16_4.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.zxy + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.zxy;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.zxy;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.zxy;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.zxy);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.zxy * u_xlat16_4.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.zxy + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat33 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat33);
    u_xlat1.x = u_xlat33 * 0.0625 + u_xlat1.y;
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_11.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_11.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.zxy);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.zxy;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.zxy;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.zxy * u_xlat16_11.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.zxy + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.zxy;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.zxy;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_17.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.zxy;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.zxy);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.zxy;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.zxy * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.zxy;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.zxy * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.zxy * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.zxy;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.zxy * u_xlat16_11.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.zxy;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.zxy + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.zxy;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.zxy;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_17.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_17.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.xyz;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.xyz + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.xyz;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.xyz + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.xyz);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.xyz;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.xyz;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.xyz;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.xyz);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.xyz;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.xyz;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.xyz;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.xyz;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.xyz + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec2 u_xlat16_12;
mediump vec2 u_xlat16_13;
bvec2 u_xlatb22;
mediump vec2 u_xlat16_23;
mediump float u_xlat16_24;
vec2 u_xlat25;
float u_xlat33;
mediump float u_xlat16_35;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_23.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_23.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_12.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_12.x + u_xlat16_1.x;
    u_xlat16_12.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_12.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_12.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0;
    u_xlat16_12.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_12.x = u_xlat16_12.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_12.x * -2.0 + 3.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_2.x;
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_2.x = u_xlat16_12.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb22.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb22.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb22.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat11.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat16_2.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat3.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_2.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_WarpMap, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_5.xyz = vec3(u_xlat16_35) * u_xlat16_5.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_35 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_35 = inversesqrt(u_xlat16_35);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_2.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat16_35 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_5.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_35) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat3.y = u_xlat6.x;
    u_xlat3.x = u_xlat4.z;
    u_xlat7.x = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat6.x = u_xlat4.y;
    u_xlat4.y = u_xlat6.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_24 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat16_24) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot((-u_xlat16_5.xyz), u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat7.xyz = u_xlat7.xyz * (-u_xlat0.xxx) + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = texture(_WaterCube, u_xlat7.xyz).xyz;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_24 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_10.xyz = vec3(u_xlat16_24) * u_xlat16_10.xyz;
    u_xlat3.z = vs_TEXCOORD1.x;
    u_xlat3.x = dot(u_xlat16_10.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat3.y = dot(u_xlat16_10.xyz, u_xlat4.xyz);
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat3.z = dot(u_xlat16_10.xyz, u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _CubePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(_CubeIntensity);
    u_xlat4.xyz = u_xlat4.xyz * _CubeColor.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat6.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat33 = dot(u_xlat3.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat33 = min(max(u_xlat33, 0.0), 1.0);
#else
    u_xlat33 = clamp(u_xlat33, 0.0, 1.0);
#endif
    u_xlat33 = u_xlat33 * 0.5 + 0.5;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _SpecularRange;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat3.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy / vs_TEXCOORD8.ww;
    u_xlat16_6.xyz = texture(_GrabTexture, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = vec3(_GrabStrength) * u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat33) * u_xlat16_2.xyz;
    u_xlat16_7.xyz = texture(_albedoMap, u_xlat25.xy).xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, u_xlat25.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.xyz;
    u_xlat3.xyz = vec3(u_xlat33) * u_xlat16_10.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_10.xyz + (-u_xlat3.xyz);
    u_xlat16_7.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat3.xyz = u_xlat16_7.zzz * u_xlat6.xyz + u_xlat3.xyz;
    u_xlat16_10.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat3.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + u_xlat3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat33 = u_xlat0.x * 0.400000006;
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = (-u_xlat33) * 0.800000012 + 1.0;
    u_xlat3.xyz = u_xlat4.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_13.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_13.xy;
    u_xlat11.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat11.xy;
    u_xlat16_11.xyz = texture(_FlowLightUpTex, u_xlat11.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_11.xyz);
    u_xlat16_35 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_35);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_35 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_35) * u_xlat16_2.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.xxx + u_xlat3.xyz;
    u_xlat3.xy = u_xlat16_5.yy * vs_TEXCOORD6.xy;
    u_xlat3.xy = vs_TEXCOORD5.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat3.xy = vs_TEXCOORD7.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat25.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat25.xy = u_xlat25.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat25.xy).xyz;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat6.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat3.xy);
    u_xlat6.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat3.xy);
    u_xlat3.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat3.xy = u_xlat16_2.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterTex, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat11.xyz = u_xlat16_2.xyz * u_xlat16_7.yyy + u_xlat11.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xyz = u_xlat0.xxx * _FresnelColor.xyz + u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_12.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.xyz);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.xyz;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.xyz;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.xyz;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = sqrt(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x + (-_FogParams.x);
    u_xlat16_3.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = (-u_xlat16_3.y) + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_3.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb21 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat21 = (u_xlatb21) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat21 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat0.yzx * u_xlat16_3.zxy;
    u_xlat4.xyz = u_xlat16_3.yzx * u_xlat0.zxy + (-u_xlat4.xyz);
    u_xlat16_5.x = sin(in_TEXCOORD2.y);
    u_xlat16_6 = cos(in_TEXCOORD2.y);
    u_xlat16_5.xyz = u_xlat4.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = vec3(u_xlat16_6) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat16_24 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_24 = sqrt(u_xlat16_24);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_24);
    u_xlat4.xyz = in_TEXCOORD2.xxx * u_xlat16_3.xyz + u_xlat4.xyz;
    vs_TEXCOORD4.xyz = u_xlat4.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5.x = u_xlat2.x;
    vs_TEXCOORD5.z = u_xlat0.x;
    vs_TEXCOORD5.y = u_xlat16_3.x;
    vs_TEXCOORD6.x = u_xlat2.y;
    vs_TEXCOORD7.x = u_xlat2.z;
    vs_TEXCOORD6.z = u_xlat0.y;
    vs_TEXCOORD7.z = u_xlat0.z;
    vs_TEXCOORD6.y = u_xlat16_3.y;
    vs_TEXCOORD7.y = u_xlat16_3.z;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD8.zw = u_xlat1.zw;
    vs_TEXCOORD8.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump float _GrabStrength;
uniform 	mediump float _GrabLuminance;
uniform 	mediump float _Distortion;
uniform 	mediump vec4 _WarpMap_ST;
uniform 	mediump float _WaveXSpeed;
uniform 	mediump float _WaveIntensity;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	mediump float _SpecularRange;
uniform 	mediump float _SpecularIntensity;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump float _GlitterFlowSpeed;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump float _FlowLightUpPower;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubePower;
uniform 	mediump float _CubeIntensity;
uniform 	mediump vec4 _Sanshe_color;
uniform 	mediump float _Sanshe_Fw;
uniform 	mediump float _Sanshe_Power;
uniform 	mediump float _Sanshe_X;
uniform 	mediump float _Sanshe_Y;
uniform 	mediump vec4 _Sanshe2_color;
uniform 	mediump float _Sanshe2_Fw;
uniform 	mediump float _Sanshe2_Power;
uniform 	mediump float _Sanshe2_X;
uniform 	mediump float _Sanshe2_Y;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseVertical;
uniform 	mediump vec2 _DissolveDirSpeed;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump samplerCube _WaterCube;
UNITY_LOCATION(1) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(2) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(4) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _WarpMap;
UNITY_LOCATION(7) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(8) uniform mediump sampler2D _GlitterTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump sampler2D _FeatureMaskTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_19;
bvec2 u_xlatb34;
mediump vec2 u_xlat16_35;
vec2 u_xlat38;
float u_xlat51;
mediump float u_xlat16_53;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolve2U, _UseDissolve2U), vec4(0.5, 0.5, 0.0, 0.0)).xy;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_35.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_35.xy + u_xlat16_1.xy;
    u_xlat16_1.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_18.x = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_1.x = u_xlat16_18.x + u_xlat16_1.x;
    u_xlat16_18.x = _Cutoff + -1.0;
    u_xlat16_1.x = u_xlat16_18.x * -1.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.20000005;
    u_xlat0.xy = vec2(_DissolveDirSpeed.x, _DissolveDirSpeed.y) * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_18.xy = vs_TEXCOORD3.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_18.xy;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_1.x * _DissolveShrink + u_xlat16_0.x;
    u_xlat16_18.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.xzw = u_xlat16_1.xxx * _DissolveEdgeColor.xyz;
    u_xlat16_18.x = u_xlat16_18.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_18.x * -2.0 + 3.0;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_2.x;
    u_xlat16_18.x = min(u_xlat16_18.x, 1.0);
    u_xlat16_2.x = u_xlat16_18.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb0.x = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_2.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_19.xy = vs_TEXCOORD3.zw * vec2(_UseFlowLight2U);
    u_xlat16_2.xy = vs_TEXCOORD3.xy * u_xlat16_2.xx + u_xlat16_19.xy;
    u_xlat0.xy = _Time.xy * vec2(0.00100000005, 0.00100000005);
    u_xlatb34.xy = greaterThanEqual(u_xlat0.xyxy, (-u_xlat0.xyxy)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec4 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb34.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb34.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(1000.0, 1000.0);
    u_xlat17.xy = u_xlat0.yy * _FlowLightUpFactory.yz + _FlowLightUpTex_ST.zw;
    u_xlat0.x = u_xlat0.x * _WaveXSpeed;
    u_xlat17.xy = u_xlat16_2.xy * _FlowLightUpTex_ST.xy + u_xlat17.xy;
    u_xlat16_17.xyz = texture(_FlowLightUpTex, u_xlat17.xy).xyz;
    u_xlat16_2.xyz = log2(u_xlat16_17.xyz);
    u_xlat16_53 = max(_FlowLightUpPower, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_53);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * _FlowLightUpColor.xyz;
    u_xlat16_53 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD3.zw * _WarpMap_ST.xy;
    u_xlat17.xy = u_xlat0.xx * vec2(-1.07000005, 1.35000002) + u_xlat16_3.xy;
    u_xlat0.xw = vs_TEXCOORD3.zw * _WarpMap_ST.xy + u_xlat0.xx;
    u_xlat16_4.xyz = texture(_WarpMap, u_xlat0.xw).xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_WarpMap, u_xlat17.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_5.xyz;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_WaveIntensity, _WaveIntensity));
    u_xlat16_53 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_emissiveMap, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_albedoMap, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * _emissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_0.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _albedoColor.xyz;
    u_xlat0.xy = u_xlat16_3.xy * vec2(vec2(_Distortion, _Distortion)) + vs_TEXCOORD8.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD8.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_0.xyz * vec3(vec3(_GrabLuminance, _GrabLuminance, _GrabLuminance));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = vec3(_GrabStrength) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_53 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_9.xyz = vec3(u_xlat16_53) * u_xlat16_9.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat16_10.xyz;
    u_xlat11.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat11.x;
    u_xlat0.x = u_xlat4.z;
    u_xlat12.x = dot(u_xlat16_9.xyz, u_xlat0.xyz);
    u_xlat11.x = u_xlat4.y;
    u_xlat4.y = u_xlat11.z;
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat12.y = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat12.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat12.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat51 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * 0.5 + 0.5;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat51);
    u_xlat14.xyz = u_xlat16_7.xyz * vec3(u_xlat51);
    u_xlat13.xyz = u_xlat13.xyz * u_xlat16_7.xyz + (-u_xlat14.xyz);
    u_xlat16_15.xyz = texture(_MaskTex, vs_TEXCOORD3.xy).xyz;
    u_xlat13.xyz = u_xlat16_15.zzz * u_xlat13.xyz + u_xlat14.xyz;
    u_xlat14.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16.xyz = u_xlat14.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat16.xyz = vec3(u_xlat51) * u_xlat16.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _SpecularRange;
    u_xlat51 = exp2(u_xlat51);
    u_xlat16_7.xyz = _SpecularColor.xyz * vec3(vec3(_SpecularIntensity, _SpecularIntensity, _SpecularIntensity));
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat51) + u_xlat13.xyz;
    u_xlat13.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat13.xyz;
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat4.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_3.xyz, u_xlat11.xyz);
    u_xlat51 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat0.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat14.xyz;
    u_xlat51 = dot((-u_xlat16_3.xyz), u_xlat0.xyz);
    u_xlat51 = u_xlat51 + u_xlat51;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat51)) + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = texture(_WaterCube, u_xlat0.xyz).xyz;
    u_xlat51 = dot(u_xlat16_3.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat51 = u_xlat51 * _CubePower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat0.xyz = vec3(u_xlat51) * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_CubeIntensity);
    u_xlat0.xyz = u_xlat0.xyz * _CubeColor.xyz;
    u_xlat51 = dot(vs_TEXCOORD1.xyz, u_xlat16_3.xyz);
    u_xlat51 = max(u_xlat51, 0.0);
    u_xlat51 = (-u_xlat51) + 1.0;
    u_xlat51 = log2(u_xlat51);
    u_xlat4.x = u_xlat51 * 0.400000006;
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat51 = exp2(u_xlat51);
    u_xlat51 = u_xlat51 * _FresnelPower;
    u_xlat4.x = exp2(u_xlat4.x);
    u_xlat4.x = (-u_xlat4.x) * 0.800000012 + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.xxx + u_xlat0.xyz;
    u_xlat4.y = _GlitterFlowSpeed * _Time.x;
    u_xlat4.x = 0.0;
    u_xlat16_2.xy = u_xlat4.xy + vs_TEXCOORD3.xy;
    u_xlat4.xy = u_xlat16_3.yy * vs_TEXCOORD6.xy;
    u_xlat4.xy = vs_TEXCOORD5.xy * u_xlat16_3.xx + u_xlat4.xy;
    u_xlat4.xy = vs_TEXCOORD7.xy * u_xlat16_3.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat16_2.xy;
    u_xlat38.xy = u_xlat16_2.xy * vec2(1.5, 1.5);
    u_xlat38.xy = u_xlat38.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_11.xyz = texture(_GlitterTex, u_xlat38.xy).xyz;
    u_xlat4.xy = u_xlat4.xy + vec2(-0.5, -0.5);
    u_xlat13.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat4.xy);
    u_xlat13.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat4.xy);
    u_xlat4.xy = u_xlat13.xy + vec2(0.5, 0.5);
    u_xlat16_2.x = _GlitterScale * 0.681690156;
    u_xlat4.xy = u_xlat16_2.xx * u_xlat4.xy;
    u_xlat16_4.xyz = texture(_GlitterTex, u_xlat4.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(_GlitterIntensity);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_GlitterContrast, _GlitterContrast, _GlitterContrast));
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GlitterColor.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat16_15.yyy + u_xlat0.xyz;
    u_xlat16_2.x = max(_FresnelScale, 0.0);
    u_xlat51 = u_xlat51 * u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat51) * _FresnelColor.xyz + u_xlat0.xyz;
    u_xlat51 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat4.xyz = vec3(u_xlat51) * u_xlat12.xyz;
    u_xlat16_3.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat16_2.xy = u_xlat14.xy * vec2(u_xlat16_53) + vec2(_Sanshe2_X, _Sanshe2_Y);
    u_xlat16_2.z = u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
    u_xlat16_2.y = dot(u_xlat4.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = (-u_xlat16_2.xy) + vec2(1.0, 1.0);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.0, 0.0));
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(0.00048828125, 0.00048828125));
    u_xlat16_19.x = log2(u_xlat16_2.y);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Fw;
    u_xlat16_19.x = exp2(u_xlat16_19.x);
    u_xlat16_19.x = u_xlat16_19.x * _Sanshe_Power;
    u_xlat16_19.xyz = u_xlat16_19.xxx * _Sanshe_color.xyz;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Fw;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Sanshe2_Power;
    u_xlat16_3.xyz = u_xlat16_2.xxx * _Sanshe2_color.xyz;
    u_xlat16_4.xy = texture(_FeatureMaskTex, vs_TEXCOORD3.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.yyy;
    u_xlat16_2.xyz = u_xlat16_19.xyz * u_xlat16_4.xxx + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xzw * u_xlat16_18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE_ON" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE_ON" }
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
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_SANSHE_ON" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_SANSHE_ON" }
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
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_SANSHE_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 98832
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
CustomEditor "CodeGenShaderGUI.Theseus_Unlit_WaterFlowLightDissolveGUI"
}