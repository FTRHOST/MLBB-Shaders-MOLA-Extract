//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/FX_Show_PBR2" {
Properties {

[Header(BaseRenderSettings__________________________________________________________________________________)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

[Header(Fresnel)] [Header(PBRRenderSettings__________________________________________________________________________________)] _Intensity ("整体强度", Float) = 1.0

_DirectionalLightColor ("平行光颜色", Color) = (1,1,1,1)

_AmbientColor ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:AO", 2D) = "white" { }

_MetallicIntensity ("金属度强度", Float) = 1.0

_RoughnessIntensity ("粗糙度强度", Float) = 1.0

_AOIntensity ("AO强度", Float) = 1.0

_BasePBRAlpha ("基础效果混合权重", Range(0, 1)) = 0.4000000059604645

_EmissionMap ("自发光贴图(rgb:自发光颜色,a:呼吸效果遮罩)", 2D) = "black" { }

_EmissionColor ("emissiveColor", Color) = (1,1,1,1)

[Toggle] _EmissiveBreathe ("自发光呼吸开关", Float) = 0.0

_EmissionBreatheSpeed ("自发光呼吸速度", Range(0, 3)) = 1.0

_EmissionBreatheStrength ("自发光呼吸阈值", Range(0, 1)) = 0.5

[Space(5)] [Toggle(_EFFECT_LIGHTING)] _EnableEffectLighting ("效果灯光开启", Float) = 0.0

_EffectLightColor ("光照颜色", Color) = (1,1,1,1)

_EffectLightDir ("光照方向", Vector) = (0,1,0,0)

[RangeSlider] _EffectLightingSlider ("阴影过度", Vector) = (0,1,-1,1)

_EffectLightAmbient ("环境光强度", Color) = (0.05,0.05,0.05,1)

[Header(PBRRenderSettings__________________________________________________________________________________)] [Header(FlowingLight)] [Toggle(_DOUBLE_FLOW_LIGHT_ON)] _EnableDoubleFlowLight ("启用双层流光", Float) = 0.0

[Toggle(_USE_SCREEN_UV)] _UseScreenUV ("使用屏幕UV", Float) = 0.0

_FlowingLightLayer01Tex ("流光layer01贴图", 2D) = "black" { }

_FlowingLightColor01 ("流光layer01叠色", Color) = (1,1,1,1)

_Layer01Strength ("Layer01Strength", Range(0, 3)) = 1.0

_FlowingLightLayer02Tex ("流光layer02贴图", 2D) = "black" { }

_FlowingLightColor02 ("流光layer01叠色", Color) = (1,1,1,1)

_Layer02Strength ("Layer02Strength", Range(0, 3)) = 1.0

_FlowingLightSpeed ("流光速度(xy:Layer01UV, zw:Layer02UV)", Vector) = (0.1,0,0.1,0)

[Header(Dissolve)] [Toggle(_DISSOLVE_ON)] _EnableDissolve ("启用溶解", Float) = 0.0

_DissolveTex ("溶解贴图", 2D) = "black" { }

[Enum(X, 0, Y, 1, NoUV, 2)] _DissolveDir ("溶解方向切换，默认根据UV横向溶解", Float) = 0.0

_DissolveNoiseParam ("XY:溶解纹理Tiling，ZW:溶解纹理UV流速", Vector) = (1,1,0,0)

_DissolveThreshold ("溶解阈值", Range(-2, 2)) = 0.0

_DissolveFallOff ("溶解边缘软硬", Range(0, 1)) = 1.0

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveColorThreshold ("溶解边缘颜色阈值", Range(-2, 2)) = 0.0

_DissolveColorFallOff ("溶解边缘颜色软硬", Range(0, 1)) = 1.0

[Toggle] _FresnelOn ("EnableFresnel", Float) = 0.0

_FresnelRange ("菲涅尔范围", Range(0, 1)) = 0.5

_FresnelFallOff ("菲涅尔衰减", Range(0, 1)) = 0.5

_FresnelColor ("菲涅尔颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 21599
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_EFFECT_LIGHTING" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_3 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_3.w>=0.5);
#else
    u_xlatb6 = u_xlat16_3.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_EFFECT_LIGHTING" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_3 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_3.w>=0.5);
#else
    u_xlatb6 = u_xlat16_3.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_EFFECT_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_3 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_3.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_EFFECT_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_3 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_3.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_0.xyz = texture(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_0.xyz = texture(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_0.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_0.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_3 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_3.w>=0.5);
#else
    u_xlatb6 = u_xlat16_3.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_3 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_3.w>=0.5);
#else
    u_xlatb6 = u_xlat16_3.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_3 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_3.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _EffectLightDir;
uniform 	mediump vec4 _EffectLightColor;
uniform 	mediump vec4 _EffectLightingSlider;
uniform 	mediump vec4 _EffectLightAmbient;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_8;
mediump float u_xlat16_14;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_19 = u_xlat0.x * u_xlat0.x;
    u_xlat16_19 = max(u_xlat16_19, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_8 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
    u_xlat16_14 = u_xlat16_8 * u_xlat16_8;
    u_xlat16_14 = u_xlat16_8 * u_xlat16_14;
    u_xlat16_8 = u_xlat16_8 * u_xlat16_8 + 0.5;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_8;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_14 + (-u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_2.x;
    u_xlat16_19 = u_xlat16_14 / u_xlat16_19;
    u_xlat6 = u_xlat16_19 * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + u_xlat0.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_20) * u_xlat16_2.xyz;
    u_xlat16_5.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_3 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_3.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_3.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_2.xyz;
    u_xlat16_19 = dot(_EffectLightDir.xyz, _EffectLightDir.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _EffectLightDir.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat16_4.xyz);
    u_xlat0.x = u_xlat16_1.x + (-_EffectLightingSlider.x);
    u_xlat6 = (-_EffectLightingSlider.x) + _EffectLightingSlider.y;
    u_xlat6 = max(u_xlat6, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat0.xxx * _EffectLightColor.xyz + _EffectLightAmbient.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = _BasePBRAlpha;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_0.xyz = texture(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6 = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_0.xyz = texture(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_FresnelOn);
#else
    u_xlatb0 = 0.5<_FresnelOn;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_0.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bool u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6 = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6 = max(u_xlat6, 0.0);
    u_xlat6 = min(u_xlat6, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat2 = fract(u_xlat2);
    u_xlat0.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat0.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_0.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    SV_Target0.w = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat0.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat0.x = u_xlat18 / u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_19 = (-u_xlat0.x) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb0 = 0.5<_FresnelOn;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    vs_TEXCOORD1.w = u_xlat16_2.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.w = u_xlat16_2.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat16_2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * in_TANGENT0.www;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat16_4.xy = vs_TEXCOORD0.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat6.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat6.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_5.xy = vs_TEXCOORD0.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_5.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
uniform 	mediump vec4 _MainTex_ST;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissionMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowingLightLayer01Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _FlowingLightLayer02Tex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat16_0.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat16_0.y * _RoughnessIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13 = min(max(u_xlat16_13, 0.0), 1.0);
#else
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
#endif
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat16_3.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_19 = u_xlat16_0.x * _MetallicIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_20 = min(max(u_xlat16_20, 0.0), 1.0);
#else
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
#endif
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _EmissionBreatheSpeed * _Time.y;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat16_2 = texture(_EmissionMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat16_2.w>=0.5);
#else
    u_xlatb6.x = u_xlat16_2.w>=0.5;
#endif
    u_xlat16_4.xyz = u_xlat16_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_EmissiveBreathe);
#else
    u_xlatb3 = 0.5<_EmissiveBreathe;
#endif
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat16_3.xyz = texture(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat16_3.xyz = texture(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(0.5<_FresnelOn);
#else
    u_xlatb6.x = 0.5<_FresnelOn;
#endif
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat16_0.x;
    u_xlat16_22 = (-u_xlat16_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
float u_xlat12;
mediump float u_xlat16_15;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat16_3.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat2.xyz * u_xlat16_3.xxx;
    vs_TEXCOORD1.w = u_xlat16_3.z;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD2.w = u_xlat16_3.x;
    vs_TEXCOORD3.w = u_xlat16_3.y;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat16_3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat16_3.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_TANGENT0.www;
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _AmbientColor;
uniform 	mediump vec4 _DirectionalLightColor;
uniform 	mediump float _Intensity;
uniform 	mediump float _AOIntensity;
uniform 	mediump float _BasePBRAlpha;
uniform 	mediump float _MetallicIntensity;
uniform 	mediump float _RoughnessIntensity;
uniform 	mediump vec4 _FlowingLightLayer01Tex_ST;
uniform 	mediump vec4 _FlowingLightLayer02Tex_ST;
uniform 	mediump vec4 _FlowingLightSpeed;
uniform 	mediump vec4 _FlowingLightColor01;
uniform 	mediump vec4 _FlowingLightColor02;
uniform 	mediump float _Layer01Strength;
uniform 	mediump float _Layer02Strength;
uniform 	mediump float _DissolveDir;
uniform 	mediump vec4 _DissolveNoiseParam;
uniform 	mediump float _DissolveThreshold;
uniform 	mediump float _DissolveFallOff;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorThreshold;
uniform 	mediump float _DissolveColorFallOff;
uniform 	mediump float _FresnelOn;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelRange;
uniform 	mediump float _FresnelFallOff;
uniform 	mediump vec4 _EmissionColor;
uniform 	mediump float _EmissiveBreathe;
uniform 	mediump float _EmissionBreatheSpeed;
uniform 	mediump float _EmissionBreatheStrength;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _EmissionMap;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FlowingLightLayer01Tex;
uniform lowp sampler2D _FlowingLightLayer02Tex;
uniform lowp sampler2D _DissolveTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
mediump float u_xlat16_13;
mediump vec2 u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = u_xlat16_1.xxx * vs_TEXCOORD2.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_1.zzz * vs_TEXCOORD1.xyz + u_xlat16_1.xyw;
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = (-vs_TEXCOORD4.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat16_2.x = vs_TEXCOORD2.w;
    u_xlat16_2.y = vs_TEXCOORD3.w;
    u_xlat16_2.z = vs_TEXCOORD1.w;
    u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat18) + u_xlat16_2.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_19 = dot(vs_TEXCOORD1.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat16_19 + (-_FresnelRange);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat16_1.x = u_xlat0.x * u_xlat0.x;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.100000001);
    u_xlat0.x = max(u_xlat21, 0.00100000005);
    u_xlat16_7 = u_xlat0.x * u_xlat0.x;
    u_xlat10_0.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat16_13 = u_xlat10_0.y * _RoughnessIntensity;
    u_xlat16_13 = clamp(u_xlat16_13, 0.0, 1.0);
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_19;
    u_xlat16_1.z = u_xlat16_13 * u_xlat16_13 + 0.5;
    u_xlat16_7 = u_xlat16_7 * u_xlat16_19 + (-u_xlat16_7);
    u_xlat16_1.y = u_xlat16_7 + 1.0;
    u_xlat16_1.xy = u_xlat16_1.zy * u_xlat16_1.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_19 / u_xlat16_1.x;
    u_xlat6.x = u_xlat16_1.x * 0.25 + -9.99999975e-06;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 20.0);
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_3.xyz;
    u_xlat16_19 = u_xlat10_0.x * _MetallicIntensity;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat10_0.z) + 1.0;
    u_xlat16_20 = u_xlat16_20 * _AOIntensity;
    u_xlat16_20 = clamp(u_xlat16_20, 0.0, 1.0);
    u_xlat16_20 = (-u_xlat16_20) + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_19 = (-u_xlat16_19) + 1.0;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_19) * _AmbientColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_20) * u_xlat16_1.xyz;
    u_xlat16_4.xyz = _DirectionalLightColor.xyz * _DirectionalLightColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * _EmissionBreatheSpeed;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat10_2 = texture2D(_EmissionMap, vs_TEXCOORD0.xy);
    u_xlatb6.x = u_xlat10_2.w>=0.5;
    u_xlat16_4.xyz = u_xlat10_2.xyz * _EmissionColor.xyz;
    u_xlat0.x = (u_xlatb6.x) ? abs(u_xlat0.x) : 1.0;
    u_xlat0.x = max(u_xlat0.x, _EmissionBreatheStrength);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlatb3 = 0.5<_EmissiveBreathe;
    u_xlat16_4.xyz = (bool(u_xlatb3)) ? u_xlat0.xyz : u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6.x = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat2 = u_xlat0.xxxx * _FlowingLightSpeed;
    u_xlat0.xy = u_xlat0.xx * _DissolveNoiseParam.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DissolveNoiseParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat2 = fract(u_xlat2);
    u_xlat6.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat16_4.xy = u_xlat6.xy * _FlowingLightLayer02Tex_ST.xy + _FlowingLightLayer02Tex_ST.zw;
    u_xlat16_16.xy = u_xlat6.xy * _FlowingLightLayer01Tex_ST.xy + _FlowingLightLayer01Tex_ST.zw;
    u_xlat6.xy = u_xlat2.xy + u_xlat16_16.xy;
    u_xlat3.xy = u_xlat2.zw + u_xlat16_4.xy;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer02Tex, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(vec3(_Layer02Strength, _Layer02Strength, _Layer02Strength));
    u_xlat16_4.xyz = u_xlat16_4.yyy * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _FlowingLightColor02.xyz;
    u_xlat10_3.xyz = texture2D(_FlowingLightLayer01Tex, u_xlat6.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_Layer01Strength);
    u_xlat16_5.xyz = u_xlat16_5.yyy * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _FlowingLightColor01.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_19 = max(u_xlat16_4.y, _BasePBRAlpha);
    u_xlat6.x = max(_FresnelFallOff, 0.00100000005);
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_4.x = (-u_xlat6.x) + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _FresnelColor.xyz + u_xlat16_1.xyz;
    u_xlatb6.x = 0.5<_FresnelOn;
    u_xlat16_1.xyz = (u_xlatb6.x) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + _DissolveColor.xyz;
    u_xlatb6.xy = equal(vec4(vec4(_DissolveDir, _DissolveDir, _DissolveDir, _DissolveDir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_22 = (u_xlatb6.x) ? vs_TEXCOORD0.x : 0.5;
    u_xlat16_22 = (u_xlatb6.y) ? vs_TEXCOORD0.y : u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 + (-_DissolveThreshold);
    u_xlat16_5.x = _DissolveColorThreshold + 1.0;
    u_xlat16_5.x = (-u_xlat16_22) * 2.0 + u_xlat16_5.x;
    u_xlat6.x = u_xlat16_22 * 2.0 + u_xlat10_0.x;
    u_xlat16_22 = (-u_xlat10_0.x) + u_xlat16_5.x;
    u_xlat0.x = u_xlat6.x + -1.0;
    u_xlat16_5.x = _DissolveColorFallOff * _DissolveColorThreshold;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.00100000005);
    u_xlat16_22 = u_xlat16_22 / u_xlat16_5.x;
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vec3(_Intensity);
    u_xlat6.x = max(_DissolveFallOff, 0.00100000005);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_19;
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_EFFECT_LIGHTING" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_DISSOLVE_ON" "_DOUBLE_FLOW_LIGHT_ON" "_USE_SCREEN_UV" }
""
}
}
}
}
}