//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/GPUEffect/GPUParticles_Unlit" {
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

[ModuleBegin(_FLIPBOOK_ON)] _ModuleBegin_Flipbook ("序列帧", Float) = 0.0

[Vector4Split(Float, Float, Hidden, Hidden)] _FlipbookRowsColumns ("图集行列 ## 行数 | 列数 | _ | _", Vector) = (8,8,0,0)

[Toggle] _AutoPlay ("自动播放", Float) = 0.0

[ModuleEnd] _PlaybackTime ("脚本播放进度", Float) = 0.0

_PlaybackTimeOffset ("给发射器或GPU留的", Float) = 0.0

[ModuleBegin] _ModuleBegin_Particle ("GPU粒子", Float) = 0.0

[KeywordEnum(ViewPlane, ViewPoint)] _BillboardMode ("Billboard模式", Float) = 0.0

[Toggle(_VELOCITYSTRETCH_ON)] _VelocityStretchToggle ("启用速度拉伸", Float) = 0.0

_VelocityStretch ("速度拉伸强度", Range(0, 2)) = 1.0

_VelocityStretchScale ("速度拉伸倍率", Float) = 0.5

[ModuleEnd] _VelocityStretchMax ("最大拉伸长度", Float) = 10.0

[ModuleBegin(_COLOUR_ON)] _ModuleBegin_Colour ("调色", Float) = 0.0

[Vector4Split(Range, Range, Range, Hidden)] _ColorGradingParams ("调色参数 ## 色相(-0.5, 0.5) | 饱和度(0, 2) | 强度(0, 2) | _", Vector) = (0,1,1,0)

_SaturationLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturationRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

[ModuleEnd] [Vector4Split(Toggle, Range, Range, Hidden)] _ColourExtraParams ("调色附加参数 ## 仅作用于主图采样(不叠加主图颜色/顶点色) | 灰度渐变暗色权重(0, 0.5) | 灰度渐变亮色权重(0.5, 1) | _", Vector) = (0,0,1,0)

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
  GpuProgramID 786
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
uint u_xlatu16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu16 = uint(_RowOffset);
    u_xlatu0 = u_xlatu16 * _BufferWidth + u_xlatu0;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
uint u_xlatu16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu16 = uint(_RowOffset);
    u_xlatu0 = u_xlatu16 * _BufferWidth + u_xlatu0;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
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
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
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
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
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
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_3.xyz));
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
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
uint u_xlatu16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu16 = uint(_RowOffset);
    u_xlatu0 = u_xlatu16 * _BufferWidth + u_xlatu0;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
uint u_xlatu16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu16 = uint(_RowOffset);
    u_xlatu0 = u_xlatu16 * _BufferWidth + u_xlatu0;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
uint u_xlatu13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu13 = uint(_RowOffset);
    u_xlatu0 = u_xlatu13 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
uint u_xlatu12;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu12 = uint(_RowOffset);
    u_xlatu0 = u_xlatu12 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
uvec4 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlatb24 = abs(u_xlat0.y)<0.999000013;
    u_xlat1.xyz = (bool(u_xlatb24)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.zxy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat24 = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat0.x = dot(in_POSITION0.xyz, u_xlat0.xyz);
    u_xlat8 = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat1.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat1.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat1.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlatb16 = 0.999000013<abs(u_xlat1.y);
    u_xlat2.xyz = (bool(u_xlatb16)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat16);
    u_xlatb16 = 9.99999997e-07<u_xlat16;
    u_xlat2.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu4.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu4.y = u_xlatu0;
    u_xlatu4.w = u_xlatu0 + _BufferHeight;
    u_xlatu4.z = 0u;
    u_xlat0.x = texelFetch(_ParticleRotTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z)).w;
    u_xlat16_5.x = sin(u_xlat0.x);
    u_xlat16_6.x = cos(u_xlat0.x);
    u_xlat7.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_6.xxx + u_xlat3.xyz;
    u_xlat0.xzw = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat7.xyz;
    u_xlat8 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xw), int(u_xlatu4.z)).w;
    u_xlat8 = u_xlat8;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = vec3(u_xlat8) * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_29 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_29 = u_xlat8 * u_xlat16_29 + _ScaleMin;
    u_xlat16_5.xyz = (-vec3(u_xlat16_29)) + u_xlat16_5.xyz;
    u_xlat16_6.x = _ScaleSeparateAxes;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz + vec3(u_xlat16_29);
    u_xlat3 = texelFetch(_ParticleTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat4 = texelFetch(_ParticleColTex, ivec2(u_xlatu4.xy), int(u_xlatu4.z));
    u_xlat8 = u_xlat3.w + 0.5;
    u_xlat16_6.x = (-u_xlat8) + 1.0;
    u_xlat8 = (-u_xlat8) + 1.0;
    u_xlat8 = u_xlat8 * _ColorMode;
    u_xlat16_6.y = 0.5;
    u_xlat25 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat25) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat16_5.xxx + u_xlat2.xyz;
    u_xlat0.xzw = u_xlat1.xyz * u_xlat16_5.zzz + u_xlat0.xzw;
    u_xlat1.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat1.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat1.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat9.xyz = u_xlat3.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat3.xxx + u_xlat9.xyz;
    u_xlat9.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat3.zzz + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx + u_xlat9.xyz;
    u_xlat1 = u_xlat0.zzzz * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xz = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xz;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat8) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat4.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(1) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(0) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
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
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump float u_xlat16_15;
mediump float u_xlat16_17;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlat16_1.xzw = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xzw = u_xlat16_2.xyz * u_xlat16_1.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_17 = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_8 = (u_xlatb5) ? u_xlat16_17 : (-u_xlat16_17);
    u_xlat16_4.x = u_xlat16_8 * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_3.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat16_3.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xzw + (-u_xlat16_6.xyz);
    u_xlat16_22 = u_xlat16_2.w + (-u_xlat16_3.w);
    u_xlat16_22 = u_xlat0.x * u_xlat16_22 + u_xlat16_3.w;
    u_xlat16_1.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat16_22 = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_22 = u_xlat16_22 * _MainColor.w;
    SV_Target0.w = u_xlat16_22 * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat26;
float u_xlat27;
bool u_xlatb27;
float u_xlat28;
bool u_xlatb28;
float u_xlat39;
float u_xlat40;
float u_xlat41;
bool u_xlatb41;
mediump float u_xlat16_43;
mediump float u_xlat16_44;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat40 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16_43 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_43 = u_xlat2.x * u_xlat16_43 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_44 = _ScaleSeparateAxes;
    u_xlat16_44 = clamp(u_xlat16_44, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_43)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_44) * u_xlat16_5.xyz + vec3(u_xlat16_43);
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat1.x = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = u_xlat1.xxx * u_xlat16_5.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * in_NORMAL0.xyz;
    u_xlatb2 = abs(u_xlat1.y)<0.999000013;
    u_xlat2.xyz = (bool(u_xlatb2)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.zxy * u_xlat1.zxy + (-u_xlat7.xyz);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat41 = inversesqrt(u_xlat41);
    u_xlat2.xyz = vec3(u_xlat41) * u_xlat2.xyz;
    u_xlat7.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat7.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat7.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat15 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat1.x = dot(in_POSITION0.xyz, u_xlat1.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat7.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : u_xlat7.xyz;
    u_xlatb14 = 0.999000013<abs(u_xlat7.y);
    u_xlat8.xyz = (bool(u_xlatb14)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.zxy * u_xlat7.zxy + (-u_xlat9.xyz);
    u_xlat14.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlatb27 = 9.99999997e-07<u_xlat14.x;
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat8.xyz = u_xlat14.xxx * u_xlat8.xyz;
    u_xlat8.xyz = (bool(u_xlatb27)) ? u_xlat8.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat9.xyz = u_xlat7.zxy * u_xlat8.yzx;
    u_xlat9.xyz = u_xlat7.yzx * u_xlat8.zxy + (-u_xlat9.xyz);
    u_xlat10.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat10.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat10.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat14.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat14.y = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat14.xy = sqrt(u_xlat14.xy);
    u_xlatb28 = 0.00100000005<u_xlat14.y;
    if(u_xlatb28){
        u_xlat16_43 = u_xlat14.y * _VelocityStretchScale;
        u_xlat16_43 = u_xlat16_43 * _VelocityStretch;
        u_xlat16_43 = min(u_xlat16_43, _VelocityStretchMax);
        u_xlat10.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat10.xyz;
        u_xlat10.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat7.xyz);
        u_xlat10.xyz = (-vec3(u_xlat27)) * u_xlat7.xyz + u_xlat10.xyz;
        u_xlat27 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb28 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat11.xyz = u_xlat7.yzx * u_xlat10.zxy;
        u_xlat11.xyz = u_xlat10.yzx * u_xlat7.zxy + (-u_xlat11.xyz);
        u_xlat27 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlatb41 = 9.99999997e-07<u_xlat27;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat11.xyz = vec3(u_xlat27) * u_xlat11.xyz;
        u_xlat11.xyz = (bool(u_xlatb41)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat11.xyz = (bool(u_xlatb28)) ? u_xlat11.xyz : u_xlat8.xyz;
        u_xlat10.xyz = (bool(u_xlatb28)) ? u_xlat10.xyz : u_xlat9.xyz;
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat12.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat11.xyz * u_xlat16_6.xxx + u_xlat12.xyz;
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_6.xxx + (-u_xlat11.xyz);
        u_xlat27 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat27 = inversesqrt(u_xlat27);
        u_xlat27 = float(1.0) / u_xlat27;
        u_xlat28 = u_xlat16_43 * 0.150000006;
        u_xlat28 = u_xlat28 * u_xlat27 + 1.0;
        u_xlat28 = float(1.0) / u_xlat28;
        u_xlat11.xyz = u_xlat2.xxx * u_xlat12.xyz;
        u_xlat11.xyz = vec3(u_xlat28) * u_xlat11.xyz;
        u_xlat12.xyz = vec3(u_xlat15) * u_xlat10.xyz;
        u_xlat12.xyz = u_xlat16_5.yyy * u_xlat12.xyz;
        u_xlat11.xyz = u_xlat11.xyz * u_xlat16_5.xxx + u_xlat12.xyz;
        u_xlat12.xyz = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat11.xyz = u_xlat12.xyz * u_xlat16_5.zzz + u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat16_43) * u_xlat10.xyz;
        u_xlat10.xyz = vec3(u_xlat27) * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat10.xyz;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat14.xxx + (-u_xlat10.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat40);
        u_xlat16_6.x = cos(u_xlat40);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat8.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat8.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat8.xyz);
        u_xlat2.xzw = u_xlat2.xxx * u_xlat11.xyz;
        u_xlat8.xyz = vec3(u_xlat15) * u_xlat8.xyz;
        u_xlat8.xyz = u_xlat16_5.yyy * u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xzw * u_xlat16_5.xxx + u_xlat8.xyz;
        u_xlat1.xzw = u_xlat1.xxx * u_xlat7.xyz;
        u_xlat1.xzw = u_xlat1.xzw * u_xlat16_5.zzz + u_xlat2.xyz;
        u_xlat10.xyz = u_xlat14.xxx * u_xlat1.xzw;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat26 = (-u_xlat39) + 1.0;
    u_xlat26 = u_xlat26 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat26) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	mediump vec3 _ScaleMin3D;
uniform 	mediump vec3 _ScaleMax3D;
uniform 	mediump float _ScaleSeparateAxes;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(2) uniform UnityPerDraw {
	mediump float _COLOR_MODE;
	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	vec4 unity_WorldTransformParams;
};
UNITY_BINDING(3) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
layout(location = 0) out mediump vec2 vs_TEXCOORD0;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat14;
uvec2 u_xlatu14;
float u_xlat24;
int u_xlati24;
uint u_xlatu24;
float u_xlat25;
float u_xlat36;
uint u_xlatu36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
float u_xlat43;
float u_xlat44;
float u_xlat45;
bool u_xlatb45;
bool u_xlatb46;
void main()
{
    u_xlati0 = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu0 = uint(u_xlati0) + _MeshInstanceOffset;
    u_xlatu0 = texelFetch(_VisibleParticleBuffer, int(u_xlatu0)).x;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat37 = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).w;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat36 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu14.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu14.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_40 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_40 = u_xlat2.x * u_xlat16_40 + _ScaleMin;
    u_xlat16_5.xyz = (-_ScaleMin3D.xyz) + _ScaleMax3D.xyz;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat16_5.xyz + _ScaleMin3D.xyz;
    u_xlat16_41 = _ScaleSeparateAxes;
    u_xlat16_41 = clamp(u_xlat16_41, 0.0, 1.0);
    u_xlat16_5.xyz = (-vec3(u_xlat16_40)) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_41) * u_xlat16_5.xyz + vec3(u_xlat16_40);
    u_xlat16_6.x = (-u_xlat36) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat36 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.xyz = vec3(u_xlat36) * u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat36 = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat2.xyz = vec3(u_xlat36) * in_NORMAL0.xyz;
    u_xlatb36 = abs(u_xlat2.y)<0.999000013;
    u_xlat7.xyz = (bool(u_xlatb36)) ? vec3(0.0, 0.0, 1.0) : vec3(0.0, 1.0, 0.0);
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat2.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat2.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat2.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat36 = dot(in_POSITION0.xyz, u_xlat7.xyz);
    u_xlat25 = dot(in_POSITION0.xyz, u_xlat8.xyz);
    u_xlat2.x = dot(in_POSITION0.xyz, u_xlat2.xyz);
    u_xlat7.x = (-hlslcc_mtx4x4unity_MatrixV[0].z);
    u_xlat7.y = (-hlslcc_mtx4x4unity_MatrixV[1].z);
    u_xlat7.z = (-hlslcc_mtx4x4unity_MatrixV[2].z);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat14.xyz = u_xlat14.xxx * u_xlat7.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat14.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : u_xlat14.xyz;
    u_xlatb7 = 0.999000013<abs(u_xlat14.y);
    u_xlat7.xyz = (bool(u_xlatb7)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.zxy * u_xlat14.zxy + (-u_xlat8.xyz);
    u_xlat43 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlatb8 = 9.99999997e-07<u_xlat43;
    u_xlat43 = inversesqrt(u_xlat43);
    u_xlat7.xyz = vec3(u_xlat43) * u_xlat7.xyz;
    u_xlat7.xyz = (bool(u_xlatb8)) ? u_xlat7.xyz : vec3(1.0, 0.0, 0.0);
    u_xlat8.xyz = u_xlat14.zxy * u_xlat7.yzx;
    u_xlat8.xyz = u_xlat14.yzx * u_xlat7.zxy + (-u_xlat8.xyz);
    u_xlat9.x = hlslcc_mtx4x4unity_ObjectToWorld[0].x;
    u_xlat9.y = hlslcc_mtx4x4unity_ObjectToWorld[1].x;
    u_xlat9.z = hlslcc_mtx4x4unity_ObjectToWorld[2].x;
    u_xlat43 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat43 = sqrt(u_xlat43);
    u_xlat44 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlatb9 = 0.00100000005<u_xlat44;
    if(u_xlatb9){
        u_xlat16_40 = u_xlat44 * _VelocityStretchScale;
        u_xlat16_40 = u_xlat16_40 * _VelocityStretch;
        u_xlat16_40 = min(u_xlat16_40, _VelocityStretchMax);
        u_xlat9.xyz = u_xlat16_4.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_4.xxx + u_xlat9.xyz;
        u_xlat9.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_4.zzz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat14.xyz);
        u_xlat9.xyz = (-vec3(u_xlat44)) * u_xlat14.xyz + u_xlat9.xyz;
        u_xlat44 = dot(u_xlat9.xyz, u_xlat9.xyz);
        u_xlatb45 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat10.xyz = u_xlat14.yzx * u_xlat9.zxy;
        u_xlat10.xyz = u_xlat9.yzx * u_xlat14.zxy + (-u_xlat10.xyz);
        u_xlat44 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlatb46 = 9.99999997e-07<u_xlat44;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat10.xyz = vec3(u_xlat44) * u_xlat10.xyz;
        u_xlat10.xyz = (bool(u_xlatb46)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat10.xyz = (bool(u_xlatb45)) ? u_xlat10.xyz : u_xlat7.xyz;
        u_xlat9.xyz = (bool(u_xlatb45)) ? u_xlat9.xyz : u_xlat8.xyz;
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat11.xyz = u_xlat16_4.xxx * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat10.xyz * u_xlat16_6.xxx + u_xlat11.xyz;
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat10.xyz;
        u_xlat9.xyz = u_xlat9.xyz * u_xlat16_6.xxx + (-u_xlat10.xyz);
        u_xlat44 = (-in_TEXCOORD0.y) + 1.0;
        u_xlat44 = inversesqrt(u_xlat44);
        u_xlat44 = float(1.0) / u_xlat44;
        u_xlat45 = u_xlat16_40 * 0.150000006;
        u_xlat45 = u_xlat45 * u_xlat44 + 1.0;
        u_xlat45 = float(1.0) / u_xlat45;
        u_xlat10.xyz = vec3(u_xlat36) * u_xlat11.xyz;
        u_xlat10.xyz = vec3(u_xlat45) * u_xlat10.xyz;
        u_xlat11.xyz = vec3(u_xlat25) * u_xlat9.xyz;
        u_xlat11.xyz = u_xlat16_5.yyy * u_xlat11.xyz;
        u_xlat10.xyz = u_xlat10.xyz * u_xlat16_5.xxx + u_xlat11.xyz;
        u_xlat11.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat10.xyz = u_xlat11.xyz * u_xlat16_5.zzz + u_xlat10.xyz;
        u_xlat9.xyz = vec3(u_xlat16_40) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat44) * u_xlat9.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat9.xyz;
        u_xlat9.xyz = u_xlat10.xyz * vec3(u_xlat43) + (-u_xlat9.xyz);
    } else {
        u_xlat16_4.x = sin(u_xlat37);
        u_xlat16_6.x = cos(u_xlat37);
        u_xlat10.xyz = u_xlat16_4.xxx * u_xlat8.xyz;
        u_xlat10.xyz = u_xlat7.xyz * u_xlat16_6.xxx + u_xlat10.xyz;
        u_xlat7.xyz = u_xlat16_4.xxx * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat7.xyz);
        u_xlat8.xyz = vec3(u_xlat36) * u_xlat10.xyz;
        u_xlat7.xyz = vec3(u_xlat25) * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat16_5.yyy * u_xlat7.xyz;
        u_xlat7.xyz = u_xlat8.xyz * u_xlat16_5.xxx + u_xlat7.xyz;
        u_xlat2.xyz = u_xlat14.xyz * u_xlat2.xxx;
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.zzz + u_xlat7.xyz;
        u_xlat9.xyz = vec3(u_xlat43) * u_xlat2.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz + u_xlat9.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati24 = int(u_xlatu24 ^ floatBitsToUint(u_xlat1.y));
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlati24 = int(uint(u_xlati24) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu24 = uint(u_xlati24) ^ 3738541696u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2146121005u;
    u_xlatu36 = u_xlatu24 >> 15u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) * 2221713035u;
    u_xlatu36 = u_xlatu24 >> 16u;
    u_xlati24 = int(u_xlatu36 ^ u_xlatu24);
    u_xlatu24 = uint(u_xlati24) & 16777215u;
    u_xlat24 = float(u_xlatu24);
    u_xlat24 = u_xlat24 * 5.96046448e-08;
    u_xlat16_1 = (-_Color) + _Color2;
    u_xlat16_1 = vec4(u_xlat24) * u_xlat16_1 + _Color;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_1.xyz;
    vs_COLOR0 = u_xlat3 * u_xlat16_1;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
UNITY_BINDING(0) uniform UnityPerCamera {
	vec4 _Time;
	vec4 _SinTime;
	vec4 _CosTime;
	vec4 unity_DeltaTime;
	vec4 _TimeParameters;
	vec3 _WorldSpaceCameraPos;
	vec4 _ProjectionParams;
	vec4 _ScreenParams;
	vec4 _ZBufferParams;
	vec4 unity_OrthoParams;
};
UNITY_BINDING(1) uniform UnityPerMaterial {
	mediump vec4 _MainTex_ST;
	mediump vec4 _MainColor;
	mediump float _Brightness;
	mediump float _Alpha;
	mediump float _AlphaFromR;
	mediump float _AlphaClipThreshold;
	mediump vec4 _FlipbookRowsColumns;
	mediump float _AutoPlay;
	float _PlaybackTime;
	float _PlaybackTimeOffset;
	mediump vec4 _ColorGradingParams;
	mediump vec4 _SaturationLeftColor;
	mediump vec4 _SaturationRightColor;
	mediump vec4 _ColourExtraParams;
};
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in mediump vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
bool u_xlatb7;
mediump float u_xlat16_8;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0 + (-_PlaybackTime);
    u_xlatb7 = _AutoPlay>=0.5;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat7.x * u_xlat0.x + _PlaybackTime;
    u_xlat0.x = u_xlat0.x + _PlaybackTimeOffset;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_1.xy = floor(_FlipbookRowsColumns.yx);
    u_xlat7.xy = max(u_xlat16_1.xy, vec2(1.0, 1.0));
    u_xlat16_1.x = u_xlat7.x * u_xlat7.y;
    u_xlat0.x = u_xlat0.x * u_xlat16_1.x;
    u_xlat21 = floor(u_xlat0.x);
    u_xlat0.w = u_xlat21 / u_xlat16_1.x;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat2 = u_xlat0.w * u_xlat16_1.x + 1.0;
    u_xlat21 = u_xlat16_1.x * u_xlat0.w;
    u_xlat16_8 = u_xlat21 / u_xlat7.x;
    u_xlat21 = u_xlat2 / u_xlat16_1.x;
    u_xlatb2 = u_xlat21>=(-u_xlat21);
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = (u_xlatb2) ? u_xlat21 : (-u_xlat21);
    u_xlat21 = u_xlat16_1.x * u_xlat21;
    u_xlat16_1.x = u_xlat21 / u_xlat7.x;
    u_xlatb21 = u_xlat16_1.x>=(-u_xlat16_1.x);
    u_xlat16_15 = fract(abs(u_xlat16_1.x));
    u_xlat16_1.x = floor(u_xlat16_1.x);
    u_xlat16_15 = (u_xlatb21) ? u_xlat16_15 : (-u_xlat16_15);
    u_xlat16_3.xy = vs_TEXCOORD0.xy;
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_4.x = u_xlat16_15 * u_xlat7.x + u_xlat16_3.x;
    u_xlat21 = u_xlat7.y + -1.0;
    u_xlat2 = (-u_xlat16_1.x) + u_xlat21;
    u_xlat16_4.y = u_xlat16_3.y + u_xlat2;
    u_xlat16_1.xz = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xz);
    u_xlatb5 = u_xlat16_8>=(-u_xlat16_8);
    u_xlat16_1.x = fract(u_xlat16_8);
    u_xlat16_8 = floor(u_xlat16_8);
    u_xlat21 = u_xlat21 + (-u_xlat16_8);
    u_xlat16_4.y = u_xlat16_3.y + u_xlat21;
    u_xlat16_1.x = (u_xlatb5) ? u_xlat16_1.x : (-u_xlat16_1.x);
    u_xlat16_4.x = u_xlat16_1.x * u_xlat7.x + u_xlat16_3.x;
    u_xlat16_1.xy = u_xlat16_4.xy / u_xlat7.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_3.x = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + u_xlat16_1.w;
    u_xlat16_10.x = u_xlat16_3.x + (-_AlphaClipThreshold);
    u_xlatb7 = u_xlat16_10.x<0.0;
    if(u_xlatb7){discard;}
    u_xlat16_10.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat16_4.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_10.xyz + u_xlat16_4.xyz;
    u_xlat0.x = (-_AlphaFromR) + 1.0;
    u_xlat0.x = max(u_xlat0.x, u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_3.x = u_xlat16_3.x * _MainColor.w;
    SV_Target0.w = u_xlat16_3.x * _Alpha;
    u_xlat16_4.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_10.xyz * u_xlat16_4.xyz + vec3(_Brightness);
    SV_Target0.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPLANE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_ALPHACLIP_ON" "_BILLBOARDMODE_VIEWPOINT" "_COLORMODE_RANDOM" "_FLIPBOOK_ON" "_VELOCITYSTRETCH_ON" }
""
}
}
}
}
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}