//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/GPUEffect/GPUParticles_Lit" {
Properties {

_ParticleBlendMode ("Particle Blend Mode", Float) = 0.0

[ModuleBegin(1)] _ModuleBegin_Render ("渲染设置", Float) = 0.0

[SurfaceType] _Surface ("表面类型", Float) = 1.0

[CommonBlendModePreset] _BlendPreset ("叠加模式", Float) = 0.0

[Toggle(_ALPHACLIP_ON)] _AlphaClip ("启用透明裁剪(AlphaTest)", Float) = 0.0

[ModuleEnd] _AlphaClipThreshold ("裁剪阈值", Range(0, 1)) = 0.5

[ModuleBegin] _ModuleBegin_Base ("基础", Float) = 0.0

[KeywordEnum(Single, Animate, Random)] _ColorMode ("粒子颜色模式", Float) = 0.0

_Color ("粒子颜色1", Color) = (1,1,1,1)

_Color2 ("粒子颜色2", Color) = (0.5,0.5,0.5,1)

_MainTex ("主贴图", 2D) = "white" { }

_MainColor ("主图颜色", Color) = (1,1,1,1)

_Brightness ("主图亮度(加法)", Range(0, 10)) = 0.0

_Alpha ("整体透明度", Range(0, 10)) = 1.0

[ModuleEnd] [Toggle] _AlphaFromR ("去黑", Float) = 0.0

[ModuleBegin] _ModuleBegin_Normal ("法线", Float) = 0.0

_NormalTex ("法线贴图", 2D) = "bump" { }

[ModuleEnd] _NormalStrength ("法线强度", Range(0, 2)) = 1.0

[ModuleBegin] _ModuleBegin_Lighting ("光照", Float) = 0.0

_EffectLightAmbient ("环境光强度", Color) = (0.05,0.05,0.05,1)

[Vector4Split(Range, Range, Hidden, Hidden)] _EffectLightingSlider ("阴影过度 ## 低(-1, 1) | 高(-1, 1) | _ | _", Vector) = (0,1,-1,1)

[KeywordEnum(OFF, DIRECT, POINT)] _LightMode ("灯光模式", Float) = 1.0

[SubModuleBegin] _SubModuleBegin_Direct ("直射光", Float) = 0.0

_EffectLightColor ("光照颜色", Color) = (1,1,1,1)

[Vector4Split(Float, Float, Float, Hidden)] [ModuleEnd(sub)] _EffectLightDir ("光照方向 ## X | Y | Z | _", Vector) = (0,1,0,0)

[SubModuleBegin] _SubModuleBegin_Point ("点光源", Float) = 0.0

_PointLightColor ("点光源颜色", Color) = (1,1,1,1)

[PointLightOffset] _PointLightPosition ("点光源位置偏移", Vector) = (0,0,0,0)

[ModuleEnd(sub)] _PointLightRange ("点光源范围", Float) = 10.0

[SubModuleBegin] _SubModuleBegin_Point2 ("点光源2", Float) = 0.0

_PointLightColor2 ("点光源2颜色", Color) = (0,0,0,1)

[PointLightOffset] _PointLightPosition2 ("点光源2位置偏移", Vector) = (0,0,0,0)

[ModuleEnd(sub, end)] _PointLightRange2 ("点光源2范围", Float) = 10.0

[ModuleBegin] _ModuleBegin_Particle ("GPU粒子", Float) = 0.0

[KeywordEnum(ViewPlane, ViewPoint)] _BillboardMode ("Billboard模式", Float) = 0.0

[Toggle(_VELOCITYSTRETCH_ON)] _VelocityStretchToggle ("启用速度拉伸", Float) = 0.0

_VelocityStretch ("速度拉伸强度", Range(0, 2)) = 1.0

_VelocityStretchScale ("速度拉伸倍率", Float) = 0.5

[ModuleEnd] _VelocityStretchMax ("最大拉伸长度", Float) = 10.0

_ScaleMin ("-", Float) = 1.0

_ScaleMax ("-", Float) = 1.0

_ScaleMin3D ("-", Vector) = (1,1,1,0)

_ScaleMax3D ("-", Vector) = (1,1,1,0)

_ScaleSeparateAxes ("-", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendOp)] _Blend ("Blend", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", Float) = 10.0

[Enum(UnityEngine.Rendering.BlendMode)] _AlphaSrcBlend ("AlphaSrcBlend", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendMode)] _AlphaDstBlend ("AlphaDstBlend", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("CullMode", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("ZTest", Float) = 4.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "ForwardBase"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 6431
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es

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
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat12 = float(_BufferWidth);
    u_xlat12 = in_TEXCOORD1.x * u_xlat12 + 0.5;
    u_xlatu12 = uint(u_xlat12);
    u_xlatu24 = uint(_RowOffset);
    u_xlatu12 = u_xlatu24 * _BufferWidth + u_xlatu12;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
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
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es

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
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat12 = float(_BufferWidth);
    u_xlat12 = in_TEXCOORD1.x * u_xlat12 + 0.5;
    u_xlatu12 = uint(u_xlat12);
    u_xlatu24 = uint(_RowOffset);
    u_xlatu12 = u_xlatu24 * _BufferWidth + u_xlatu12;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
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
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es
#extension GL_EXT_texture_buffer : require

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
uniform 	int unity_BaseInstanceID;
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	uint _MeshInstanceOffset;
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlati12 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu12 = uint(u_xlati12) + _MeshInstanceOffset;
    u_xlatu12 = texelFetch(_VisibleParticleBuffer, int(u_xlatu12)).x;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
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
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es
#extension GL_EXT_texture_buffer : require

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
uniform 	int unity_BaseInstanceID;
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	uint _MeshInstanceOffset;
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlati12 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu12 = uint(u_xlati12) + _MeshInstanceOffset;
    u_xlatu12 = texelFetch(_VisibleParticleBuffer, int(u_xlatu12)).x;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
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
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es

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
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat12 = float(_BufferWidth);
    u_xlat12 = in_TEXCOORD1.x * u_xlat12 + 0.5;
    u_xlatu12 = uint(u_xlat12);
    u_xlatu24 = uint(_RowOffset);
    u_xlatu12 = u_xlatu24 * _BufferWidth + u_xlatu12;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0 = max(u_xlat0, u_xlat16_2.x);
    u_xlat0 = u_xlat0 * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0 * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es

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
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat12 = float(_BufferWidth);
    u_xlat12 = in_TEXCOORD1.x * u_xlat12 + 0.5;
    u_xlatu12 = uint(u_xlat12);
    u_xlatu24 = uint(_RowOffset);
    u_xlatu12 = u_xlatu24 * _BufferWidth + u_xlatu12;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0 = max(u_xlat0, u_xlat16_2.x);
    u_xlat0 = u_xlat0 * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0 * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es
#extension GL_EXT_texture_buffer : require

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
uniform 	int unity_BaseInstanceID;
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	uint _MeshInstanceOffset;
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlati12 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu12 = uint(u_xlati12) + _MeshInstanceOffset;
    u_xlatu12 = texelFetch(_VisibleParticleBuffer, int(u_xlatu12)).x;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0 = max(u_xlat0, u_xlat16_2.x);
    u_xlat0 = u_xlat0 * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0 * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
"#ifdef VERTEX
#version 310 es
#extension GL_EXT_texture_buffer : require

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
uniform 	int unity_BaseInstanceID;
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	uint _MeshInstanceOffset;
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
UNITY_BINDING(1) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(2) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
layout(location = 2) out mediump vec2 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
layout(location = 3) out mediump vec3 vs_TEXCOORD2;
layout(location = 4) out mediump vec3 vs_TEXCOORD3;
layout(location = 5) out mediump vec3 vs_TEXCOORD4;
layout(location = 6) out highp vec3 vs_TEXCOORD5;
layout(location = 7) out highp vec3 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
uint u_xlatu2;
vec4 u_xlat3;
uvec4 u_xlatu3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
mediump vec3 u_xlat16_13;
float u_xlat24;
bool u_xlatb24;
float u_xlat36;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = _ScaleSeparateAxes;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_13.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlati12 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu12 = uint(u_xlati12) + _MeshInstanceOffset;
    u_xlatu12 = texelFetch(_VisibleParticleBuffer, int(u_xlatu12)).x;
    u_xlatu2 = u_xlatu12 / _BufferWidth;
    u_xlatu3.x = u_xlatu12 % _BufferWidth;
    u_xlatu3.w = u_xlatu2 + _BufferHeight;
    u_xlatu3.y = u_xlatu2;
    u_xlatu3.z = 0u;
    u_xlat12 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xw), int(u_xlatu3.z)).w;
    u_xlat12 = u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16_13.xyz = vec3(u_xlat12) * u_xlat16_13.xyz + _ScaleMin3D.xyz;
    u_xlat16_4.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_4.x = u_xlat12 * u_xlat16_4.x + _ScaleMin;
    u_xlat16_13.xyz = u_xlat16_13.xyz + (-u_xlat16_4.xxx);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_13.xyz + u_xlat16_4.xxx;
    u_xlat16_4.y = 0.5;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat12 = u_xlat2.w + 0.5;
    u_xlat16_4.x = (-u_xlat12) + 1.0;
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = u_xlat12 * _ColorMode;
    u_xlat24 = textureLod(_ScaleOverLifeTex, u_xlat16_4.xy, 0.0).x;
    u_xlat16_1.xyz = vec3(u_xlat24) * u_xlat16_1.xyz;
    u_xlat24 = texelFetch(_ParticleRotTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu3.xy), int(u_xlatu3.z));
    u_xlat16_4.x = sin(u_xlat24);
    u_xlat16_5 = cos(u_xlat24);
    u_xlat6.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat6.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat6.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat24 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat6.xyz;
    u_xlatb24 = 0.999000013<abs(u_xlat6.y);
    u_xlat7.xyz = (bool(u_xlatb24)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat6.zxy + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat24);
    u_xlatb24 = 9.99999997e-07<u_xlat24;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb24)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat6.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat6.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
    u_xlat9.xyz = u_xlat8.xyz * vec3(u_xlat16_5) + (-u_xlat9.xyz);
    u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat16_5) + u_xlat8.xyz;
    u_xlat24 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat8.xyz = vec3(u_xlat24) * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat8.y)<0.999000013;
    u_xlat10.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.zxy * u_xlat8.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat10.xyz = vec3(u_xlat24) * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat8.zxy * u_xlat10.yzx;
    u_xlat11.xyz = u_xlat8.yzx * u_xlat10.zxy + (-u_xlat11.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat11.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat11.xyz);
    u_xlat11.xyz = u_xlat9.xyz * vec3(u_xlat36);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat24);
    u_xlat9.xyz = u_xlat16_1.yyy * u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat10.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat10.xyz);
    u_xlat10.xyz = vec3(u_xlat36) * u_xlat7.xyz + u_xlat11.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat36 = dot(in_TANGENT0.xyz, u_xlat8.xyz);
    u_xlat8.xyz = vec3(u_xlat36) * u_xlat6.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat6.xyz * vec3(u_xlat24);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat16_1.zzz + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat2.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat2.xxx + u_xlat9.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat7.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD5.xyz = u_xlat0.xzw;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat12) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_4.xyz = u_xlat0.yzx * u_xlat6.zxy;
    u_xlat16_4.xyz = u_xlat6.yzx * u_xlat0.zxy + (-u_xlat16_4.xyz);
    vs_TEXCOORD4.xyz = u_xlat6.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * in_TANGENT0.www;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _NormalTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump float _NormalStrength;
	mediump vec3 _EffectLightColor;
	mediump vec4 _EffectLightDir;
	mediump vec3 _PointLightColor;
	vec4 _PointLightPosition;
	mediump float _PointLightRange;
	mediump vec3 _PointLightColor2;
	vec4 _PointLightPosition2;
	mediump float _PointLightRange2;
	mediump vec4 _EffectLightAmbient;
	mediump vec4 _EffectLightingSlider;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = (-_AlphaFromR) + 1.0;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0 = max(u_xlat0, u_xlat16_2.x);
    u_xlat0 = u_xlat0 * u_xlat16_1.w;
    u_xlat16_14 = u_xlat0 * vs_COLOR0.w;
    u_xlat16_14 = u_xlat16_14 * _MainColor.w;
    SV_Target0.w = u_xlat16_14 * _Alpha;
    u_xlat16_3.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" "_LIGHTMODE_OFF" }
""
}
}
}
}
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}