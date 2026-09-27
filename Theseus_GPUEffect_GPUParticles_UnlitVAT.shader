//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/GPUEffect/GPUParticles_UnlitVAT" {
Properties {

[ModuleBegin(1)] _ModuleBegin_Render ("渲染设置", Float) = 0.0

[SurfaceType] _Surface ("表面类型", Float) = 1.0

[CommonBlendModePreset] _BlendPreset ("混合模式", Float) = 1.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("剔除模式", Float) = 2.0

[Toggle(_ALPHACLIP_ON)] _AlphaClip ("启用透明裁剪(CutOut)", Float) = 0.0

[ModuleEnd] _AlphaTest ("透明裁剪阈值(AlphaTest)", Range(0, 1)) = 0.5

[ModuleBegin] _ModuleBegin_Base ("基础", Float) = 0.0

[KeywordEnum(Single, Animate, Random)] _ColorMode ("颜色模式", Float) = 0.0

_Color ("颜色1", Color) = (1,1,1,1)

_Color2 ("颜色2", Color) = (0.5,0.5,0.5,1)

_MainTex ("主贴图", 2D) = "white" { }

[ModuleEnd] _ScaleOverLifeTex ("生命周期缩放曲线贴图", 2D) = "white" { }

[ModuleBegin] _ModuleBegin_VAT ("顶点动画贴图(VAT)", Float) = 0.0

_VATTex ("VAT位置贴图", 2D) = "black" { }

_FrameCount ("帧数", Float) = 1.0

_TexHeight ("贴图高度", Float) = 1.0

_Length ("片段时长(秒)", Float) = 1.0

_Speed ("播放速度", Float) = 1.0

_VATSpeedRandom ("每粒子随机速度范围(±)", Range(0, 1)) = 0.0

_VATRandomOffset ("每粒子随机相位偏移", Range(0, 1)) = 0.0

[ModuleEnd] [Toggle(_VAT_INTERPOLATE)] _VATInterp ("VAT帧插值", Float) = 1.0

[ModuleBegin(_VELOCITYSTRETCH_ON)] _ModuleBegin_VelocityStretch ("速度拉伸", Float) = 0.0

_VelocityStretch ("拉伸强度", Range(0, 2)) = 1.0

_VelocityStretchScale ("速度倍率", Float) = 0.5

[ModuleEnd] _VelocityStretchMax ("最大拉伸长度", Float) = 10.0

[ModuleBegin(_VELOCITYORIENT_ON)] _ModuleBegin_VelocityOrient ("朝向速度方向", Float) = 0.0

[ModuleEnd] [Enum(PosX, 0, NegX, 1, PosY, 2, NegY, 3, PosZ, 4, NegZ, 5)] _VelocityOrientAxis ("局部前方轴", Float) = 4.0

[ModuleBegin(_FRESNEL_ON)] _ModuleBegin_Fresnel ("菲涅尔", Float) = 0.0

_FresnelMap ("叠乘贴图", 2D) = "white" { }

_FresnelColor ("颜色", Color) = (1,1,1,1)

[ModuleEnd] [Vector4Split(Toggle, Range, Range, Enum)] _FresnelParams ("Fresnel参数 ## 反向Fresnel Alpha | 范围(0, 2) | 强度(0, 1) | 叠加模式{Multiply=0, Add=1}", Vector) = (0,1,0.01,0)

[ModuleBegin(_FALLOFF_DISSOLVE_ON)] _ModuleBegin_Dissolve ("溶解", Float) = 0.0

_DissolveTex ("溶解噪声", 2D) = "white" { }

[Vector4Split(Float, Float, Range, Range)] _DissolveUVParams ("溶解UV参数 ## U方向流速 | V方向流速 | 缩放(0, 10) | 旋转(0, 720)", Vector) = (0,0,1,0)

[Vector4Split(UVDirection, Hidden, Range)] _DissolveConfigParams ("溶解配置参数 ## 溶解方向切换 | _ | 溶解形状强度(0, 5)", Vector) = (0,0,1,0)

[Vector4Split(Range, Range, Range, Range)] _DissolveControlParams ("溶解控制参数 ## 溶解(-2, 2) | 溶解软硬(0, 1) | 溶解边缘(0, 2) | 溶解边缘软硬(0, 1)", Vector) = (0,0,0,0)

[Vector4Split(Toggle, Hidden, Hidden, Hidden)] _DissolveExtraParams ("溶解扩展参数 ## 开启极坐标 | _ | _ | _", Vector) = (0,0,0,0)

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

[ModuleEnd] [Ramp] _DissolveColorRampTex ("溶解边缘Ramp图", 2D) = "white" { }

_ScaleMin ("-", Float) = 1.0

_ScaleMax ("-", Float) = 1.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendOp)] _Blend ("Blend", Float) = 0.0

[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", Float) = 1.0

_EnableMainPremultAlpha ("EnableMainPremultAlpha", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 34231
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu6.x = uint(_RowOffset);
    u_xlatu0 = u_xlatu6.x * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu6.x = uint(_RowOffset);
    u_xlatu0 = u_xlatu6.x * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
uint u_xlatu14;
bool u_xlatb16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
mediump vec3 u_xlat16_19;
bool u_xlatb30;
float u_xlat32;
uvec2 u_xlatu32;
mediump float u_xlat16_33;
float u_xlat42;
float u_xlat43;
uint u_xlatu43;
bool u_xlatb43;
uint u_xlatu46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu14 = uint(_RowOffset);
    u_xlatu0 = u_xlatu14 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat42 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat43 = u_xlat2.x * 16777215.0;
    u_xlat43 = roundEven(u_xlat43);
    u_xlatu43 = uint(u_xlat43);
    u_xlatu4.xy = uvec2(u_xlatu43) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat42) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat43 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat43 * u_xlat16_5.x;
    u_xlat43 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat43>=(-u_xlat43);
    u_xlat43 = fract(abs(u_xlat43));
    u_xlat43 = (u_xlatb2) ? u_xlat43 : (-u_xlat43);
    u_xlat43 = u_xlat43 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat32 = _VATSpeedRandom + 1.0;
    u_xlatu46 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati18 = int(u_xlatu46 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu46 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu46 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlati4.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu18 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat18 = (-u_xlat2.x) + u_xlat32;
    u_xlat2.x = u_xlat4.x * u_xlat18 + u_xlat2.x;
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat43 = u_xlat43 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat43 = u_xlat43 / u_xlat2.x;
    u_xlat43 = fract(u_xlat43);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat43);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat43 = fract(u_xlat43);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat43) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb43 = u_xlat16_19.x>=9.99999997e-07;
    if(u_xlatb43){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb43 = 1.0<u_xlat16_33;
        u_xlat16_47 = inversesqrt(u_xlat16_33);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_47);
        u_xlat16_6.xyz = (bool(u_xlatb43)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_33 = (u_xlatb43) ? 1.0 : u_xlat16_33;
        u_xlat1.x = (-u_xlat16_33) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_19.xyz = u_xlat2.yzw * u_xlat16_19.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb16 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb16 = u_xlatb16 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb16 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_48 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_19.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_19.zxy + (-u_xlat16_10.xyz);
        u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat16_19.xyz);
        u_xlat2.x = u_xlat16_19.x + 1.0;
        u_xlatb16 = u_xlat2.x<9.99999975e-05;
        u_xlatb30 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_19.xyz = (bool(u_xlatb30)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb16)) ? u_xlat16_19.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb16) ? 0.0 : u_xlat2.x;
        u_xlat16_19.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_2 = u_xlat16_19.xxxx * u_xlat16_7;
        u_xlat16_19.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_19.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_19.xyz);
        u_xlat16_19.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_19.xyz;
        u_xlat16_48 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_19.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz;
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_19.yzx + (-u_xlat16_9.xyz);
        u_xlat16_19.xyz = u_xlat16_19.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_19.xyz;
        u_xlat16_6.xyz = u_xlat16_19.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_19.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat16_1.xyz);
        u_xlat16_19.xyz = u_xlat16_2.xyz * (-u_xlat16_19.xxx);
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_19.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_19.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat13.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat13.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat13.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat42 = u_xlat42 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat42) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
uint u_xlatu14;
bool u_xlatb16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
mediump vec3 u_xlat16_19;
bool u_xlatb30;
float u_xlat32;
uvec2 u_xlatu32;
mediump float u_xlat16_33;
float u_xlat42;
float u_xlat43;
uint u_xlatu43;
bool u_xlatb43;
uint u_xlatu46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu14 = uint(_RowOffset);
    u_xlatu0 = u_xlatu14 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat42 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat43 = u_xlat2.x * 16777215.0;
    u_xlat43 = roundEven(u_xlat43);
    u_xlatu43 = uint(u_xlat43);
    u_xlatu4.xy = uvec2(u_xlatu43) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat42) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat43 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat43 * u_xlat16_5.x;
    u_xlat43 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat43>=(-u_xlat43);
    u_xlat43 = fract(abs(u_xlat43));
    u_xlat43 = (u_xlatb2) ? u_xlat43 : (-u_xlat43);
    u_xlat43 = u_xlat43 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat32 = _VATSpeedRandom + 1.0;
    u_xlatu46 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati18 = int(u_xlatu46 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu46 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu46 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlati4.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu18 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat18 = (-u_xlat2.x) + u_xlat32;
    u_xlat2.x = u_xlat4.x * u_xlat18 + u_xlat2.x;
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat43 = u_xlat43 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat43 = u_xlat43 / u_xlat2.x;
    u_xlat43 = fract(u_xlat43);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat43);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat43 = fract(u_xlat43);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat43) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb43 = u_xlat16_19.x>=9.99999997e-07;
    if(u_xlatb43){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb43 = 1.0<u_xlat16_33;
        u_xlat16_47 = inversesqrt(u_xlat16_33);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_47);
        u_xlat16_6.xyz = (bool(u_xlatb43)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_33 = (u_xlatb43) ? 1.0 : u_xlat16_33;
        u_xlat1.x = (-u_xlat16_33) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_19.xyz = u_xlat2.yzw * u_xlat16_19.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb16 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb16 = u_xlatb16 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb16 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_48 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_19.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_19.zxy + (-u_xlat16_10.xyz);
        u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat16_19.xyz);
        u_xlat2.x = u_xlat16_19.x + 1.0;
        u_xlatb16 = u_xlat2.x<9.99999975e-05;
        u_xlatb30 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_19.xyz = (bool(u_xlatb30)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb16)) ? u_xlat16_19.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb16) ? 0.0 : u_xlat2.x;
        u_xlat16_19.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_2 = u_xlat16_19.xxxx * u_xlat16_7;
        u_xlat16_19.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_19.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_19.xyz);
        u_xlat16_19.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_19.xyz;
        u_xlat16_48 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_19.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz;
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_19.yzx + (-u_xlat16_9.xyz);
        u_xlat16_19.xyz = u_xlat16_19.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_19.xyz;
        u_xlat16_6.xyz = u_xlat16_19.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_19.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat16_1.xyz);
        u_xlat16_19.xyz = u_xlat16_2.xyz * (-u_xlat16_19.xxx);
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_19.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_19.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat13.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat13.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat13.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat42 = u_xlat42 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat42) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlat9.x = float(_BufferWidth);
    u_xlat9.x = in_TEXCOORD1.x * u_xlat9.x + 0.5;
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu18 = uint(_RowOffset);
    u_xlatu9.x = u_xlatu18 * _BufferWidth + u_xlatu9.x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlat9.x = float(_BufferWidth);
    u_xlat9.x = in_TEXCOORD1.x * u_xlat9.x + 0.5;
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu18 = uint(_RowOffset);
    u_xlatu9.x = u_xlatu18 * _BufferWidth + u_xlatu9.x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
uint u_xlatu11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu11 = uint(_RowOffset);
    u_xlatu0 = u_xlatu11 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
uint u_xlatu11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu11 = uint(_RowOffset);
    u_xlatu0 = u_xlatu11 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
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
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
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
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb15;
float u_xlat17;
int u_xlati17;
uint u_xlatu17;
mediump vec3 u_xlat16_18;
bool u_xlatb28;
float u_xlat30;
uvec2 u_xlatu30;
mediump float u_xlat16_31;
float u_xlat39;
float u_xlat40;
uint u_xlatu40;
bool u_xlatb40;
uint u_xlatu43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
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
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat40 = u_xlat2.x * 16777215.0;
    u_xlat40 = roundEven(u_xlat40);
    u_xlatu40 = uint(u_xlat40);
    u_xlatu4.xy = uvec2(u_xlatu40) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat40 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat40 * u_xlat16_5.x;
    u_xlat40 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat40>=(-u_xlat40);
    u_xlat40 = fract(abs(u_xlat40));
    u_xlat40 = (u_xlatb2) ? u_xlat40 : (-u_xlat40);
    u_xlat40 = u_xlat40 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat30 = _VATSpeedRandom + 1.0;
    u_xlatu43 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati17 = int(u_xlatu43 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu17 = uint(u_xlati17) * 2146121005u;
    u_xlatu43 = u_xlatu17 >> 15u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlatu17 = uint(u_xlati17) * 2221713035u;
    u_xlatu43 = u_xlatu17 >> 16u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlati4.x = int(uint(u_xlati17) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu17 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat17 = (-u_xlat2.x) + u_xlat30;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat40 = u_xlat40 / u_xlat2.x;
    u_xlat40 = fract(u_xlat40);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat40);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat40 = fract(u_xlat40);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_18.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb40 = u_xlat16_18.x>=9.99999997e-07;
    if(u_xlatb40){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_31 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb40 = 1.0<u_xlat16_31;
        u_xlat16_44 = inversesqrt(u_xlat16_31);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_44);
        u_xlat16_6.xyz = (bool(u_xlatb40)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_31 = (u_xlatb40) ? 1.0 : u_xlat16_31;
        u_xlat1.x = (-u_xlat16_31) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_18.xyz = u_xlat2.yzw * u_xlat16_18.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb15 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb15 = u_xlatb15 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb15 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_45 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_18.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_18.zxy + (-u_xlat16_10.xyz);
        u_xlat16_18.x = dot(u_xlat16_8.xyz, u_xlat16_18.xyz);
        u_xlat2.x = u_xlat16_18.x + 1.0;
        u_xlatb15 = u_xlat2.x<9.99999975e-05;
        u_xlatb28 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_18.xyz = (bool(u_xlatb28)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb15)) ? u_xlat16_18.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb15) ? 0.0 : u_xlat2.x;
        u_xlat16_18.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_2 = u_xlat16_18.xxxx * u_xlat16_7;
        u_xlat16_18.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_18.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_18.xyz);
        u_xlat16_18.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_18.xyz;
        u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_18.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz;
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_18.yzx + (-u_xlat16_9.xyz);
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_18.xyz;
        u_xlat16_6.xyz = u_xlat16_18.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_18.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_18.x = dot(u_xlat16_18.xyz, u_xlat16_1.xyz);
        u_xlat16_18.xyz = u_xlat16_2.xyz * (-u_xlat16_18.xxx);
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_18.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_18.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat39) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb15;
float u_xlat17;
int u_xlati17;
uint u_xlatu17;
mediump vec3 u_xlat16_18;
bool u_xlatb28;
float u_xlat30;
uvec2 u_xlatu30;
mediump float u_xlat16_31;
float u_xlat39;
float u_xlat40;
uint u_xlatu40;
bool u_xlatb40;
uint u_xlatu43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
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
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat40 = u_xlat2.x * 16777215.0;
    u_xlat40 = roundEven(u_xlat40);
    u_xlatu40 = uint(u_xlat40);
    u_xlatu4.xy = uvec2(u_xlatu40) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat40 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat40 * u_xlat16_5.x;
    u_xlat40 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat40>=(-u_xlat40);
    u_xlat40 = fract(abs(u_xlat40));
    u_xlat40 = (u_xlatb2) ? u_xlat40 : (-u_xlat40);
    u_xlat40 = u_xlat40 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat30 = _VATSpeedRandom + 1.0;
    u_xlatu43 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati17 = int(u_xlatu43 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu17 = uint(u_xlati17) * 2146121005u;
    u_xlatu43 = u_xlatu17 >> 15u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlatu17 = uint(u_xlati17) * 2221713035u;
    u_xlatu43 = u_xlatu17 >> 16u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlati4.x = int(uint(u_xlati17) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu17 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat17 = (-u_xlat2.x) + u_xlat30;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat40 = u_xlat40 / u_xlat2.x;
    u_xlat40 = fract(u_xlat40);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat40);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat40 = fract(u_xlat40);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_18.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb40 = u_xlat16_18.x>=9.99999997e-07;
    if(u_xlatb40){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_31 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb40 = 1.0<u_xlat16_31;
        u_xlat16_44 = inversesqrt(u_xlat16_31);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_44);
        u_xlat16_6.xyz = (bool(u_xlatb40)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_31 = (u_xlatb40) ? 1.0 : u_xlat16_31;
        u_xlat1.x = (-u_xlat16_31) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_18.xyz = u_xlat2.yzw * u_xlat16_18.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb15 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb15 = u_xlatb15 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb15 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_45 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_18.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_18.zxy + (-u_xlat16_10.xyz);
        u_xlat16_18.x = dot(u_xlat16_8.xyz, u_xlat16_18.xyz);
        u_xlat2.x = u_xlat16_18.x + 1.0;
        u_xlatb15 = u_xlat2.x<9.99999975e-05;
        u_xlatb28 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_18.xyz = (bool(u_xlatb28)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb15)) ? u_xlat16_18.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb15) ? 0.0 : u_xlat2.x;
        u_xlat16_18.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_2 = u_xlat16_18.xxxx * u_xlat16_7;
        u_xlat16_18.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_18.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_18.xyz);
        u_xlat16_18.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_18.xyz;
        u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_18.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz;
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_18.yzx + (-u_xlat16_9.xyz);
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_18.xyz;
        u_xlat16_6.xyz = u_xlat16_18.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_18.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_18.x = dot(u_xlat16_18.xyz, u_xlat16_1.xyz);
        u_xlat16_18.xyz = u_xlat16_2.xyz * (-u_xlat16_18.xxx);
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_18.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_18.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat39) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlati9.x = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu9.x = uint(u_xlati9.x) + _MeshInstanceOffset;
    u_xlatu9.x = texelFetch(_VisibleParticleBuffer, int(u_xlatu9.x)).x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlati9.x = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu9.x = uint(u_xlati9.x) + _MeshInstanceOffset;
    u_xlatu9.x = texelFetch(_VisibleParticleBuffer, int(u_xlatu9.x)).x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
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
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
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
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
Keywords { "_COLOR_HDR_" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu6.x = uint(_RowOffset);
    u_xlatu0 = u_xlatu6.x * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu6.x = uint(_RowOffset);
    u_xlatu0 = u_xlatu6.x * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
uint u_xlatu14;
bool u_xlatb16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
mediump vec3 u_xlat16_19;
bool u_xlatb30;
float u_xlat32;
uvec2 u_xlatu32;
mediump float u_xlat16_33;
float u_xlat42;
float u_xlat43;
uint u_xlatu43;
bool u_xlatb43;
uint u_xlatu46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu14 = uint(_RowOffset);
    u_xlatu0 = u_xlatu14 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat42 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat43 = u_xlat2.x * 16777215.0;
    u_xlat43 = roundEven(u_xlat43);
    u_xlatu43 = uint(u_xlat43);
    u_xlatu4.xy = uvec2(u_xlatu43) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat42) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat43 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat43 * u_xlat16_5.x;
    u_xlat43 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat43>=(-u_xlat43);
    u_xlat43 = fract(abs(u_xlat43));
    u_xlat43 = (u_xlatb2) ? u_xlat43 : (-u_xlat43);
    u_xlat43 = u_xlat43 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat32 = _VATSpeedRandom + 1.0;
    u_xlatu46 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati18 = int(u_xlatu46 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu46 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu46 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlati4.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu18 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat18 = (-u_xlat2.x) + u_xlat32;
    u_xlat2.x = u_xlat4.x * u_xlat18 + u_xlat2.x;
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat43 = u_xlat43 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat43 = u_xlat43 / u_xlat2.x;
    u_xlat43 = fract(u_xlat43);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat43);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat43 = fract(u_xlat43);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat43) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb43 = u_xlat16_19.x>=9.99999997e-07;
    if(u_xlatb43){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb43 = 1.0<u_xlat16_33;
        u_xlat16_47 = inversesqrt(u_xlat16_33);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_47);
        u_xlat16_6.xyz = (bool(u_xlatb43)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_33 = (u_xlatb43) ? 1.0 : u_xlat16_33;
        u_xlat1.x = (-u_xlat16_33) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_19.xyz = u_xlat2.yzw * u_xlat16_19.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb16 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb16 = u_xlatb16 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb16 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_48 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_19.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_19.zxy + (-u_xlat16_10.xyz);
        u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat16_19.xyz);
        u_xlat2.x = u_xlat16_19.x + 1.0;
        u_xlatb16 = u_xlat2.x<9.99999975e-05;
        u_xlatb30 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_19.xyz = (bool(u_xlatb30)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb16)) ? u_xlat16_19.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb16) ? 0.0 : u_xlat2.x;
        u_xlat16_19.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_2 = u_xlat16_19.xxxx * u_xlat16_7;
        u_xlat16_19.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_19.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_19.xyz);
        u_xlat16_19.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_19.xyz;
        u_xlat16_48 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_19.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz;
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_19.yzx + (-u_xlat16_9.xyz);
        u_xlat16_19.xyz = u_xlat16_19.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_19.xyz;
        u_xlat16_6.xyz = u_xlat16_19.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_19.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat16_1.xyz);
        u_xlat16_19.xyz = u_xlat16_2.xyz * (-u_xlat16_19.xxx);
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_19.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_19.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat13.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat13.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat13.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat42 = u_xlat42 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat42) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
uint u_xlatu14;
bool u_xlatb16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
mediump vec3 u_xlat16_19;
bool u_xlatb30;
float u_xlat32;
uvec2 u_xlatu32;
mediump float u_xlat16_33;
float u_xlat42;
float u_xlat43;
uint u_xlatu43;
bool u_xlatb43;
uint u_xlatu46;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu14 = uint(_RowOffset);
    u_xlatu0 = u_xlatu14 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat42 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat43 = u_xlat2.x * 16777215.0;
    u_xlat43 = roundEven(u_xlat43);
    u_xlatu43 = uint(u_xlat43);
    u_xlatu4.xy = uvec2(u_xlatu43) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu32.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu32.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat42) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat43 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat43 * u_xlat16_5.x;
    u_xlat43 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat43>=(-u_xlat43);
    u_xlat43 = fract(abs(u_xlat43));
    u_xlat43 = (u_xlatb2) ? u_xlat43 : (-u_xlat43);
    u_xlat43 = u_xlat43 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat32 = _VATSpeedRandom + 1.0;
    u_xlatu46 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati18 = int(u_xlatu46 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu46 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu46 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu46 ^ u_xlatu18);
    u_xlati4.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu18 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu18 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu18 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat18 = (-u_xlat2.x) + u_xlat32;
    u_xlat2.x = u_xlat4.x * u_xlat18 + u_xlat2.x;
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat43 = u_xlat43 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat43 = u_xlat43 / u_xlat2.x;
    u_xlat43 = fract(u_xlat43);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat43 = u_xlat43 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat43);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat43 = fract(u_xlat43);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat43) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_19.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb43 = u_xlat16_19.x>=9.99999997e-07;
    if(u_xlatb43){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_33 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb43 = 1.0<u_xlat16_33;
        u_xlat16_47 = inversesqrt(u_xlat16_33);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_47);
        u_xlat16_6.xyz = (bool(u_xlatb43)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_33 = (u_xlatb43) ? 1.0 : u_xlat16_33;
        u_xlat1.x = (-u_xlat16_33) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_19.xyz = u_xlat2.yzw * u_xlat16_19.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb16 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb16 = u_xlatb16 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb16 = u_xlatb16 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb16 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_48 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_19.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_19.zxy + (-u_xlat16_10.xyz);
        u_xlat16_19.x = dot(u_xlat16_8.xyz, u_xlat16_19.xyz);
        u_xlat2.x = u_xlat16_19.x + 1.0;
        u_xlatb16 = u_xlat2.x<9.99999975e-05;
        u_xlatb30 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_19.xyz = (bool(u_xlatb30)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb16)) ? u_xlat16_19.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb16) ? 0.0 : u_xlat2.x;
        u_xlat16_19.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_19.x = inversesqrt(u_xlat16_19.x);
        u_xlat16_2 = u_xlat16_19.xxxx * u_xlat16_7;
        u_xlat16_19.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_19.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_19.xyz);
        u_xlat16_19.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_19.xyz;
        u_xlat16_48 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_48)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_19.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_19.xyz * u_xlat16_6.xyz;
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_19.yzx + (-u_xlat16_9.xyz);
        u_xlat16_19.xyz = u_xlat16_19.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_19.xyz;
        u_xlat16_6.xyz = u_xlat16_19.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_19.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_19.x = dot(u_xlat16_19.xyz, u_xlat16_1.xyz);
        u_xlat16_19.xyz = u_xlat16_2.xyz * (-u_xlat16_19.xxx);
        u_xlat16_19.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_19.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_19.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat13.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat13.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat13.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat13.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat42 = u_xlat42 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat42) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlat9.x = float(_BufferWidth);
    u_xlat9.x = in_TEXCOORD1.x * u_xlat9.x + 0.5;
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu18 = uint(_RowOffset);
    u_xlatu9.x = u_xlatu18 * _BufferWidth + u_xlatu9.x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlat9.x = float(_BufferWidth);
    u_xlat9.x = in_TEXCOORD1.x * u_xlat9.x + 0.5;
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu18 = uint(_RowOffset);
    u_xlatu9.x = u_xlatu18 * _BufferWidth + u_xlatu9.x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
uint u_xlatu11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu11 = uint(_RowOffset);
    u_xlatu0 = u_xlatu11 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	vec4 hlslcc_mtx4x4_LocalToWorld[4];
uniform 	mediump float _ColorMode;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _Color2;
uniform 	mediump float _ScaleMin;
uniform 	mediump float _ScaleMax;
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	float _RowOffset;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
uint u_xlatu11;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
void main()
{
    u_xlat0.x = float(_BufferWidth);
    u_xlat0.x = in_TEXCOORD1.x * u_xlat0.x + 0.5;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlatu11 = uint(_RowOffset);
    u_xlatu0 = u_xlatu11 * _BufferWidth + u_xlatu0;
    u_xlatu1.x = u_xlatu0 % _BufferWidth;
    u_xlatu0 = u_xlatu0 / _BufferWidth;
    u_xlatu1.w = u_xlatu0 + _BufferHeight;
    u_xlatu1.y = u_xlatu0;
    u_xlatu1.z = 0u;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).wxyz;
    u_xlat3.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).xyz;
    u_xlat16_4.xyz = u_xlat2.yzw + u_xlat3.xyz;
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
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
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(5) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
uvec4 u_xlatu1;
vec4 u_xlat2;
uvec2 u_xlatu2;
vec4 u_xlat3;
mediump vec2 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
ivec2 u_xlati6;
uvec2 u_xlatu6;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
float u_xlat18;
uint u_xlatu18;
bool u_xlatb18;
float u_xlat20;
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
    u_xlat0.x = texelFetch(_ParticleTex, ivec2(u_xlatu1.xw), int(u_xlatu1.z)).w;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * 16777215.0;
    u_xlat6.x = roundEven(u_xlat6.x);
    u_xlatu6.x = uint(u_xlat6.x);
    u_xlatu6.xy = u_xlatu6.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(15u, 15u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu2.xy = u_xlatu6.xy >> uvec2(16u, 16u);
    u_xlati6.xy = ivec2(u_xlatu6.xy ^ u_xlatu2.xy);
    u_xlatu6.xy = uvec2(u_xlati6.xy) & uvec2(16777215u, 16777215u);
    u_xlat6.xy = vec2(u_xlatu6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu18 = floatBitsToUint(u_xlat6.y) >> 16u;
    u_xlati12 = int(u_xlatu18 ^ floatBitsToUint(u_xlat6.y));
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu18 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu18 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu18 ^ u_xlatu12);
    u_xlati6.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat6.x));
    u_xlatu6.x = uint(u_xlati6.x) ^ 777037954u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2146121005u;
    u_xlatu12 = u_xlatu6.x >> 15u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) * 2221713035u;
    u_xlatu12 = u_xlatu6.x >> 16u;
    u_xlati6.x = int(u_xlatu12 ^ u_xlatu6.x);
    u_xlatu6.x = uint(u_xlati6.x) & 16777215u;
    u_xlat6.x = float(u_xlatu6.x);
    u_xlat6.x = u_xlat6.x * 5.96046448e-08;
    u_xlat12 = _VATSpeedRandom + 1.0;
    u_xlat18 = (-_VATSpeedRandom) + 1.0;
    u_xlat12 = (-u_xlat18) + u_xlat12;
    u_xlat6.x = u_xlat6.x * u_xlat12 + u_xlat18;
    u_xlat12 = _Time.y * 0.000277777785;
    u_xlatb18 = u_xlat12>=(-u_xlat12);
    u_xlat12 = fract(abs(u_xlat12));
    u_xlat12 = (u_xlatb18) ? u_xlat12 : (-u_xlat12);
    u_xlat12 = u_xlat12 * _Speed;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat6.x = u_xlat6.x / u_xlat12;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat6.x = floor(u_xlat6.x);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlat2.y = u_xlat6.x / _TexHeight;
    u_xlat2.x = in_TEXCOORD2.x;
    u_xlat6.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2 = texelFetch(_ParticleTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat1 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat20 = u_xlat2.w + 0.5;
    u_xlat16_3.x = (-u_xlat20) + 1.0;
    u_xlat20 = (-u_xlat20) + 1.0;
    u_xlat20 = u_xlat20 * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat4 = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat4 * u_xlat16_3.x;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat16_3.xxx + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = vec4(u_xlat20) * u_xlat0 + _Color;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat1.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb15;
float u_xlat17;
int u_xlati17;
uint u_xlatu17;
mediump vec3 u_xlat16_18;
bool u_xlatb28;
float u_xlat30;
uvec2 u_xlatu30;
mediump float u_xlat16_31;
float u_xlat39;
float u_xlat40;
uint u_xlatu40;
bool u_xlatb40;
uint u_xlatu43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
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
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat40 = u_xlat2.x * 16777215.0;
    u_xlat40 = roundEven(u_xlat40);
    u_xlatu40 = uint(u_xlat40);
    u_xlatu4.xy = uvec2(u_xlatu40) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat40 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat40 * u_xlat16_5.x;
    u_xlat40 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat40>=(-u_xlat40);
    u_xlat40 = fract(abs(u_xlat40));
    u_xlat40 = (u_xlatb2) ? u_xlat40 : (-u_xlat40);
    u_xlat40 = u_xlat40 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat30 = _VATSpeedRandom + 1.0;
    u_xlatu43 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati17 = int(u_xlatu43 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu17 = uint(u_xlati17) * 2146121005u;
    u_xlatu43 = u_xlatu17 >> 15u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlatu17 = uint(u_xlati17) * 2221713035u;
    u_xlatu43 = u_xlatu17 >> 16u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlati4.x = int(uint(u_xlati17) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu17 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat17 = (-u_xlat2.x) + u_xlat30;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat40 = u_xlat40 / u_xlat2.x;
    u_xlat40 = fract(u_xlat40);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat40);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat40 = fract(u_xlat40);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_18.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb40 = u_xlat16_18.x>=9.99999997e-07;
    if(u_xlatb40){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_31 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb40 = 1.0<u_xlat16_31;
        u_xlat16_44 = inversesqrt(u_xlat16_31);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_44);
        u_xlat16_6.xyz = (bool(u_xlatb40)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_31 = (u_xlatb40) ? 1.0 : u_xlat16_31;
        u_xlat1.x = (-u_xlat16_31) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_18.xyz = u_xlat2.yzw * u_xlat16_18.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb15 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb15 = u_xlatb15 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb15 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_45 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_18.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_18.zxy + (-u_xlat16_10.xyz);
        u_xlat16_18.x = dot(u_xlat16_8.xyz, u_xlat16_18.xyz);
        u_xlat2.x = u_xlat16_18.x + 1.0;
        u_xlatb15 = u_xlat2.x<9.99999975e-05;
        u_xlatb28 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_18.xyz = (bool(u_xlatb28)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb15)) ? u_xlat16_18.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb15) ? 0.0 : u_xlat2.x;
        u_xlat16_18.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_2 = u_xlat16_18.xxxx * u_xlat16_7;
        u_xlat16_18.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_18.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_18.xyz);
        u_xlat16_18.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_18.xyz;
        u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_18.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz;
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_18.yzx + (-u_xlat16_9.xyz);
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_18.xyz;
        u_xlat16_6.xyz = u_xlat16_18.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_18.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_18.x = dot(u_xlat16_18.xyz, u_xlat16_1.xyz);
        u_xlat16_18.xyz = u_xlat16_2.xyz * (-u_xlat16_18.xxx);
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_18.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_18.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat39) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(6) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
ivec2 u_xlati4;
uvec2 u_xlatu4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb15;
float u_xlat17;
int u_xlati17;
uint u_xlatu17;
mediump vec3 u_xlat16_18;
bool u_xlatb28;
float u_xlat30;
uvec2 u_xlatu30;
mediump float u_xlat16_31;
float u_xlat39;
float u_xlat40;
uint u_xlatu40;
bool u_xlatb40;
uint u_xlatu43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
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
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat39 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat40 = u_xlat2.x * 16777215.0;
    u_xlat40 = roundEven(u_xlat40);
    u_xlatu40 = uint(u_xlat40);
    u_xlatu4.xy = uvec2(u_xlatu40) ^ uvec2(2769414579u, 1675113877u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(15u, 15u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu30.xy = u_xlatu4.xy >> uvec2(16u, 16u);
    u_xlati4.xy = ivec2(u_xlatu30.xy ^ u_xlatu4.xy);
    u_xlatu4.xy = uvec2(u_xlati4.xy) & uvec2(16777215u, 16777215u);
    u_xlat4.xy = vec2(u_xlatu4.xy);
    u_xlat4.xy = u_xlat4.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_5.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_5.x + _ScaleMin;
    u_xlat16_6.x = (-u_xlat39) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat40 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_5.x = u_xlat40 * u_xlat16_5.x;
    u_xlat40 = _Time.y * 0.000277777785;
    u_xlatb2 = u_xlat40>=(-u_xlat40);
    u_xlat40 = fract(abs(u_xlat40));
    u_xlat40 = (u_xlatb2) ? u_xlat40 : (-u_xlat40);
    u_xlat40 = u_xlat40 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat30 = _VATSpeedRandom + 1.0;
    u_xlatu43 = floatBitsToUint(u_xlat4.y) >> 16u;
    u_xlati17 = int(u_xlatu43 ^ floatBitsToUint(u_xlat4.y));
    u_xlatu17 = uint(u_xlati17) * 2146121005u;
    u_xlatu43 = u_xlatu17 >> 15u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlatu17 = uint(u_xlati17) * 2221713035u;
    u_xlatu43 = u_xlatu17 >> 16u;
    u_xlati17 = int(u_xlatu43 ^ u_xlatu17);
    u_xlati4.x = int(uint(u_xlati17) ^ floatBitsToUint(u_xlat4.x));
    u_xlatu4.x = uint(u_xlati4.x) ^ 777037954u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2146121005u;
    u_xlatu17 = u_xlatu4.x >> 15u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) * 2221713035u;
    u_xlatu17 = u_xlatu4.x >> 16u;
    u_xlati4.x = int(u_xlatu17 ^ u_xlatu4.x);
    u_xlatu4.x = uint(u_xlati4.x) & 16777215u;
    u_xlat4.x = float(u_xlatu4.x);
    u_xlat4.x = u_xlat4.x * 5.96046448e-08;
    u_xlat17 = (-u_xlat2.x) + u_xlat30;
    u_xlat2.x = u_xlat4.x * u_xlat17 + u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat40 * 3600.0;
    u_xlat2.x = max(_Length, 9.99999975e-05);
    u_xlat40 = u_xlat40 / u_xlat2.x;
    u_xlat40 = fract(u_xlat40);
    u_xlat2.x = _FrameCount + -1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat4.x = floor(u_xlat40);
    u_xlat4.xy = u_xlat4.xx + vec2(1.0, 0.5);
    u_xlat2.x = min(u_xlat2.x, u_xlat4.x);
    u_xlat4.y = u_xlat4.y / _TexHeight;
    u_xlat4.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat4.xy, 0.0).xyz;
    u_xlat2.x = u_xlat2.x + 0.5;
    u_xlat4.w = u_xlat2.x / _TexHeight;
    u_xlat4.xyz = textureLod(_VATTex, u_xlat4.zw, 0.0).xyz;
    u_xlat40 = fract(u_xlat40);
    u_xlat4.xyz = (-u_xlat7.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat40) * u_xlat4.xyz + u_xlat7.xyz;
    u_xlat16_18.x = dot(u_xlat2.yzw, u_xlat2.yzw);
    u_xlatb40 = u_xlat16_18.x>=9.99999997e-07;
    if(u_xlatb40){
        u_xlat1.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
        u_xlat16_31 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlatb40 = 1.0<u_xlat16_31;
        u_xlat16_44 = inversesqrt(u_xlat16_31);
        u_xlat16_6.xyz = u_xlat1.zxy * vec3(u_xlat16_44);
        u_xlat16_6.xyz = (bool(u_xlatb40)) ? u_xlat16_6.xyz : u_xlat1.zxy;
        u_xlat16_31 = (u_xlatb40) ? 1.0 : u_xlat16_31;
        u_xlat1.x = (-u_xlat16_31) + 1.0;
        u_xlat1.x = max(u_xlat1.x, 0.0);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_18.xyz = u_xlat2.yzw * u_xlat16_18.xxx;
        u_xlat2.x = _VelocityOrientAxis + 0.5;
        u_xlati2 = int(u_xlat2.x);
        u_xlatb7 = equal(ivec4(u_xlati2), ivec4(0, 1, 2, 3));
        u_xlatb15 = u_xlati2==4;
        u_xlat16_8.xyz = (u_xlatb7.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb15 = u_xlatb15 || u_xlatb7.w;
        u_xlat16_8.xyz = (u_xlatb7.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.z;
        u_xlat16_8.xyz = (u_xlatb7.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb15 = u_xlatb15 || u_xlatb7.y;
        u_xlat16_8.xyz = (int(u_xlati2) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb2 = u_xlatb15 || u_xlatb7.x;
        u_xlat16_8.xyz = (bool(u_xlatb2)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.yzx * vec3(-1.0, -1.0, -1.0);
        u_xlat16_1.x = u_xlat1.x;
        u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_9.zxy;
        u_xlat16_10.xyz = u_xlat16_8.zxy * u_xlat16_9.xyz + (-u_xlat16_10.xyz);
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_1.xxx + u_xlat16_10.xyz;
        u_xlat16_45 = dot(u_xlat16_8.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_10.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_11.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_10.yzx + (-u_xlat16_11.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_10.xyz;
        u_xlat16_10.xyz = u_xlat16_18.yzx * u_xlat16_8.zxy;
        u_xlat16_10.xyz = u_xlat16_8.yzx * u_xlat16_18.zxy + (-u_xlat16_10.xyz);
        u_xlat16_18.x = dot(u_xlat16_8.xyz, u_xlat16_18.xyz);
        u_xlat2.x = u_xlat16_18.x + 1.0;
        u_xlatb15 = u_xlat2.x<9.99999975e-05;
        u_xlatb28 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_11.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_11.z = 0.0;
        u_xlat16_12.x = 0.0;
        u_xlat16_12.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_18.xyz = (bool(u_xlatb28)) ? u_xlat16_11.xyz : u_xlat16_12.xyz;
        u_xlat16_7.xyz = (bool(u_xlatb15)) ? u_xlat16_18.xyz : u_xlat16_10.xyz;
        u_xlat16_7.w = (u_xlatb15) ? 0.0 : u_xlat2.x;
        u_xlat16_18.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
        u_xlat16_2 = u_xlat16_18.xxxx * u_xlat16_7;
        u_xlat16_18.xyz = u_xlat4.xyz * u_xlat16_9.zxy;
        u_xlat16_18.xyz = u_xlat4.zxy * u_xlat16_9.xyz + (-u_xlat16_18.xyz);
        u_xlat16_18.xyz = u_xlat4.yzx * u_xlat16_1.xxx + u_xlat16_18.xyz;
        u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16_9.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_45)) * u_xlat16_6.yzx;
        u_xlat16_8.xyz = u_xlat16_18.zxy * u_xlat16_1.xxx + u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_18.xyz * u_xlat16_6.xyz;
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_18.yzx + (-u_xlat16_9.xyz);
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlat16_1 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_1.zxy * u_xlat16_18.xyz;
        u_xlat16_6.xyz = u_xlat16_18.zxy * u_xlat16_1.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_18.yzx * u_xlat16_1.www + u_xlat16_6.xyz;
        u_xlat16_18.x = dot(u_xlat16_18.xyz, u_xlat16_1.xyz);
        u_xlat16_18.xyz = u_xlat16_2.xyz * (-u_xlat16_18.xxx);
        u_xlat16_18.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_18.xyz;
        u_xlat16_8.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_6.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_18.xyz + u_xlat16_6.xyz;
        u_xlat4.xyz = u_xlat16_4.xyz;
    }
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_5.xxx + u_xlat0.xyz;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat39 = u_xlat39 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat39) * u_xlat1 + _Color;
    u_xlat16_5.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_5.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlati9.x = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu9.x = uint(u_xlati9.x) + _MeshInstanceOffset;
    u_xlatu9.x = texelFetch(_VisibleParticleBuffer, int(u_xlatu9.x)).x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
uint u_xlatu1;
vec4 u_xlat2;
uvec4 u_xlatu2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec2 u_xlati9;
uvec2 u_xlatu9;
bool u_xlatb9;
vec3 u_xlat10;
uvec2 u_xlatu10;
bool u_xlatb10;
vec3 u_xlat16;
float u_xlat18;
int u_xlati18;
uint u_xlatu18;
float u_xlat19;
float u_xlat27;
mediump float u_xlat16_27;
uint u_xlatu27;
bool u_xlatb27;
float u_xlat28;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Speed;
    u_xlati9.x = gl_InstanceID + unity_BaseInstanceID;
    u_xlatu9.x = uint(u_xlati9.x) + _MeshInstanceOffset;
    u_xlatu9.x = texelFetch(_VisibleParticleBuffer, int(u_xlatu9.x)).x;
    u_xlatu1 = u_xlatu9.x / _BufferWidth;
    u_xlatu2.x = u_xlatu9.x % _BufferWidth;
    u_xlatu2.w = u_xlatu1 + _BufferHeight;
    u_xlatu2.y = u_xlatu1;
    u_xlatu2.z = 0u;
    u_xlat1 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).wxyz;
    u_xlat9.xyz = texelFetch(_ParticleAnimatedVelocityTex, ivec2(u_xlatu2.xw), int(u_xlatu2.z)).xyz;
    u_xlat16_3.xyz = u_xlat9.xyz + u_xlat1.yzw;
    u_xlat1.x = u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat9.x = u_xlat1.x * 16777215.0;
    u_xlat9.x = roundEven(u_xlat9.x);
    u_xlatu9.x = uint(u_xlat9.x);
    u_xlatu9.xy = u_xlatu9.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(15u, 15u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu10.xy = u_xlatu9.xy >> uvec2(16u, 16u);
    u_xlati9.xy = ivec2(u_xlatu9.xy ^ u_xlatu10.xy);
    u_xlatu9.xy = uvec2(u_xlati9.xy) & uvec2(16777215u, 16777215u);
    u_xlat9.xy = vec2(u_xlatu9.xy);
    u_xlat9.xy = u_xlat9.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlatu27 = floatBitsToUint(u_xlat9.y) >> 16u;
    u_xlati18 = int(u_xlatu27 ^ floatBitsToUint(u_xlat9.y));
    u_xlatu18 = uint(u_xlati18) * 2146121005u;
    u_xlatu27 = u_xlatu18 >> 15u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlatu18 = uint(u_xlati18) * 2221713035u;
    u_xlatu27 = u_xlatu18 >> 16u;
    u_xlati18 = int(u_xlatu27 ^ u_xlatu18);
    u_xlati9.x = int(uint(u_xlati18) ^ floatBitsToUint(u_xlat9.x));
    u_xlatu9.x = uint(u_xlati9.x) ^ 777037954u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2146121005u;
    u_xlatu18 = u_xlatu9.x >> 15u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) * 2221713035u;
    u_xlatu18 = u_xlatu9.x >> 16u;
    u_xlati9.x = int(u_xlatu18 ^ u_xlatu9.x);
    u_xlatu9.x = uint(u_xlati9.x) & 16777215u;
    u_xlat9.x = float(u_xlatu9.x);
    u_xlat9.x = u_xlat9.x * 5.96046448e-08;
    u_xlat18 = _VATSpeedRandom + 1.0;
    u_xlat27 = (-_VATSpeedRandom) + 1.0;
    u_xlat18 = (-u_xlat27) + u_xlat18;
    u_xlat9.x = u_xlat9.x * u_xlat18 + u_xlat27;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat9.x = max(_Length, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat9.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat9.x = _FrameCount + -1.0;
    u_xlat9.x = max(u_xlat9.x, 0.0);
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.y = u_xlat0.x / _TexHeight;
    u_xlat0.x = in_TEXCOORD2.x;
    u_xlat0.xyz = textureLod(_VATTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z)).xyz;
    u_xlat16_30 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_4.x = inversesqrt(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat10.xyz * u_xlat16_4.xxx;
    u_xlatb27 = 1.0<u_xlat16_30;
    u_xlat16_30 = (u_xlatb27) ? 1.0 : u_xlat16_30;
    u_xlat16_4.xyz = (bool(u_xlatb27)) ? u_xlat16_4.xyz : u_xlat10.xyz;
    u_xlat27 = (-u_xlat16_30) + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.zxy;
    u_xlat16_5.xyz = u_xlat16_3.zxy * u_xlat16_4.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_3.yzx * vec3(u_xlat27) + u_xlat16_5.xyz;
    u_xlat16_27 = u_xlat27;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat10.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat16_3.xyz = u_xlat16_4.zxy * vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = (-vec3(u_xlat16_30)) * u_xlat16_3.yzx;
    u_xlat16_4.xyz = u_xlat16_5.zxy * vec3(u_xlat16_27) + u_xlat16_4.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.zxy * u_xlat16_5.yzx + (-u_xlat16_6.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_30 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_30 = inversesqrt(u_xlat16_30);
    u_xlat16_3.xyz = vec3(u_xlat16_30) * u_xlat16_3.xyz;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat16_3.xyz);
    u_xlat7.xyz = (-u_xlat16_3.xyz) * vec3(u_xlat19) + u_xlat0.xyz;
    u_xlat16_30 = u_xlat10.x * _VelocityStretchScale;
    u_xlatb10 = u_xlat10.x>=0.00100000005;
    u_xlat16_30 = u_xlat16_30 * _VelocityStretch;
    u_xlat16_30 = min(u_xlat16_30, _VelocityStretchMax);
    u_xlat8.xyz = vec3(u_xlat16_30) * (-u_xlat16_3.xyz);
    u_xlat19 = u_xlat16_30 * 0.150000006;
    u_xlat28 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat28) + u_xlat0.xyz;
    u_xlat19 = u_xlat19 * u_xlat28 + 1.0;
    u_xlat19 = float(1.0) / u_xlat19;
    u_xlat19 = (-u_xlat19) + 1.0;
    u_xlat7.xyz = (-u_xlat7.xyz) * vec3(u_xlat19) + u_xlat8.xyz;
    u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : u_xlat0.xyz;
    u_xlat0 = texelFetch(_ParticleTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat2 = texelFetch(_ParticleColTex, ivec2(u_xlatu2.xy), int(u_xlatu2.z));
    u_xlat7.x = u_xlat0.w + 0.5;
    u_xlat16_3.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat7.x = u_xlat7.x * _ColorMode;
    u_xlat16_3.y = 0.5;
    u_xlat16.x = textureLod(_ScaleOverLifeTex, u_xlat16_3.xy, 0.0).x;
    u_xlat16_3.x = (-_ScaleMin) + _ScaleMax;
    u_xlat16_3.x = u_xlat1.x * u_xlat16_3.x + _ScaleMin;
    u_xlat16_3.x = u_xlat16.x * u_xlat16_3.x;
    u_xlat1.xyz = u_xlat10.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat16.xyz = u_xlat1.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat1.xxx + u_xlat16.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = (-_Color) + _Color2;
    u_xlat0 = u_xlat7.xxxx * u_xlat0 + _Color;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat0.xyz;
    vs_COLOR0.w = u_xlat2.w * u_xlat0.w;
    vs_COLOR0.xyz = u_xlat2.xyz * u_xlat16_3.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
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
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
uniform 	uint _BufferWidth;
uniform 	uint _BufferHeight;
uniform 	mediump float _VelocityStretch;
uniform 	mediump float _VelocityStretchScale;
uniform 	mediump float _VelocityStretchMax;
uniform 	vec4 _MainTex_ST;
uniform 	float _FrameCount;
uniform 	float _TexHeight;
uniform 	float _Length;
uniform 	float _Speed;
uniform 	float _VATSpeedRandom;
uniform 	mediump float _VelocityOrientAxis;
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
UNITY_BINDING(1) uniform UnityPerFrame {
	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	vec4 hlslcc_mtx4x4unity_MatrixV[4];
	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
};
UNITY_LOCATION(1) uniform mediump sampler2D _ScaleOverLifeTex;
UNITY_LOCATION(2) uniform mediump sampler2D _VATTex;
UNITY_LOCATION(3) uniform highp sampler2D _ParticleTex;
UNITY_LOCATION(4) uniform highp sampler2D _ParticleAnimatedVelocityTex;
UNITY_LOCATION(5) uniform highp sampler2D _ParticleRotTex;
UNITY_LOCATION(6) uniform highp sampler2D _ParticleColTex;
UNITY_LOCATION(7) uniform highp usamplerBuffer _VisibleParticleBuffer;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
layout(location = 0) out highp vec2 vs_TEXCOORD0;
layout(location = 2) out highp vec3 vs_TEXCOORD1;
layout(location = 1) out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati0;
uint u_xlatu0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec2 u_xlati1;
uvec4 u_xlatu1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
float u_xlat12;
int u_xlati12;
uint u_xlatu12;
vec3 u_xlat13;
uvec2 u_xlatu13;
bool u_xlatb13;
float u_xlat23;
uint u_xlatu24;
bool u_xlatb24;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
bool u_xlatb35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat40;
mediump float u_xlat16_41;
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
    u_xlat13.xyz = texelFetch(_ParticleRotTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z)).xyz;
    u_xlat16_37 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlatb34 = 1.0<u_xlat16_37;
    u_xlat16_5.x = inversesqrt(u_xlat16_37);
    u_xlat16_5.xyz = u_xlat13.zxy * u_xlat16_5.xxx;
    u_xlat16_5.xyz = (bool(u_xlatb34)) ? u_xlat16_5.xyz : u_xlat13.zxy;
    u_xlat16_37 = (u_xlatb34) ? 1.0 : u_xlat16_37;
    u_xlat34 = (-u_xlat16_37) + 1.0;
    u_xlat34 = max(u_xlat34, 0.0);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat3 = texelFetch(_ParticleColTex, ivec2(u_xlatu1.xy), int(u_xlatu1.z));
    u_xlat33 = u_xlat0.w + 0.5;
    u_xlat2.x = u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat1.x = u_xlat2.x * 16777215.0;
    u_xlat1.x = roundEven(u_xlat1.x);
    u_xlatu1.x = uint(u_xlat1.x);
    u_xlatu1.xy = u_xlatu1.xx ^ uvec2(2769414579u, 1675113877u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2146121005u, 2146121005u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(15u, 15u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) * uvec2(2221713035u, 2221713035u);
    u_xlatu13.xy = u_xlatu1.xy >> uvec2(16u, 16u);
    u_xlati1.xy = ivec2(u_xlatu1.xy ^ u_xlatu13.xy);
    u_xlatu1.xy = uvec2(u_xlati1.xy) & uvec2(16777215u, 16777215u);
    u_xlat1.xy = vec2(u_xlatu1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(5.96046448e-08, 5.96046448e-08);
    u_xlat16_37 = (-_ScaleMin) + _ScaleMax;
    u_xlat16_37 = u_xlat2.x * u_xlat16_37 + _ScaleMin;
    u_xlat16_6.x = (-u_xlat33) + 1.0;
    u_xlat16_6.y = 0.5;
    u_xlat23 = textureLod(_ScaleOverLifeTex, u_xlat16_6.xy, 0.0).x;
    u_xlat16_37 = u_xlat23 * u_xlat16_37;
    u_xlat23 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat23>=(-u_xlat23);
    u_xlat23 = fract(abs(u_xlat23));
    u_xlat23 = (u_xlatb2.x) ? u_xlat23 : (-u_xlat23);
    u_xlat23 = u_xlat23 * _Speed;
    u_xlat2.x = (-_VATSpeedRandom) + 1.0;
    u_xlat13.x = _VATSpeedRandom + 1.0;
    u_xlatu24 = floatBitsToUint(u_xlat1.y) >> 16u;
    u_xlati12 = int(floatBitsToUint(u_xlat1.y) ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2146121005u;
    u_xlatu24 = u_xlatu12 >> 15u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlatu12 = uint(u_xlati12) * 2221713035u;
    u_xlatu24 = u_xlatu12 >> 16u;
    u_xlati12 = int(u_xlatu12 ^ u_xlatu24);
    u_xlati1.x = int(uint(u_xlati12) ^ floatBitsToUint(u_xlat1.x));
    u_xlatu1.x = uint(u_xlati1.x) ^ 777037954u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2146121005u;
    u_xlatu12 = u_xlatu1.x >> 15u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) * 2221713035u;
    u_xlatu12 = u_xlatu1.x >> 16u;
    u_xlati1.x = int(u_xlatu12 ^ u_xlatu1.x);
    u_xlatu1.x = uint(u_xlati1.x) & 16777215u;
    u_xlat1.x = float(u_xlatu1.x);
    u_xlat1.x = u_xlat1.x * 5.96046448e-08;
    u_xlat12 = (-u_xlat2.x) + u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat12 + u_xlat2.x;
    u_xlat1.x = u_xlat1.x * u_xlat23;
    u_xlat1.x = u_xlat1.x * 3600.0;
    u_xlat12 = max(_Length, 9.99999975e-05);
    u_xlat1.x = u_xlat1.x / u_xlat12;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat12 = _FrameCount + -1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat23 = floor(u_xlat1.x);
    u_xlat2.xy = vec2(u_xlat23) + vec2(1.0, 0.5);
    u_xlat12 = min(u_xlat12, u_xlat2.x);
    u_xlat2.y = u_xlat2.y / _TexHeight;
    u_xlat2.xz = in_TEXCOORD2.xx;
    u_xlat7.xyz = textureLod(_VATTex, u_xlat2.xy, 0.0).xyz;
    u_xlat12 = u_xlat12 + 0.5;
    u_xlat2.w = u_xlat12 / _TexHeight;
    u_xlat2.xyz = textureLod(_VATTex, u_xlat2.zw, 0.0).xyz;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat2.xyz = (-u_xlat7.xyz) + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat7.xyz;
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlatb13 = u_xlat2.x>=0.00100000005;
    u_xlat16_38 = u_xlat2.x * _VelocityStretchScale;
    u_xlat16_38 = u_xlat16_38 * _VelocityStretch;
    u_xlat16_38 = min(u_xlat16_38, _VelocityStretchMax);
    u_xlat16_6.xyz = u_xlat16_5.yzx * vec3(-1.0, -1.0, -1.0);
    u_xlat16_39 = u_xlat34;
    u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_4.zxy * u_xlat16_5.yzx + (-u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_4.yzx * vec3(u_xlat16_39) + u_xlat16_8.xyz;
    u_xlat16_41 = dot(u_xlat16_4.zxy, u_xlat16_5.xyz);
    u_xlat16_9.xyz = u_xlat16_6.xyz * (-vec3(u_xlat16_41));
    u_xlat16_9.xyz = u_xlat16_8.zxy * vec3(u_xlat16_39) + u_xlat16_9.xyz;
    u_xlat16_10.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_6.yzx * u_xlat16_8.yzx + (-u_xlat16_10.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_41 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_41 = inversesqrt(u_xlat16_41);
    u_xlat16_8.xyz = vec3(u_xlat16_41) * u_xlat16_8.xyz;
    u_xlat34 = (-in_TEXCOORD0.y) + 1.0;
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat2.xzw = vec3(u_xlat16_38) * (-u_xlat16_8.xyz);
    u_xlat2.xzw = u_xlat2.xzw * vec3(u_xlat34) + u_xlat1.xyz;
    u_xlat7.x = dot(u_xlat1.xyz, u_xlat16_8.xyz);
    u_xlat7.xyz = (-u_xlat16_8.xyz) * u_xlat7.xxx + u_xlat1.xyz;
    u_xlat40 = u_xlat16_38 * 0.150000006;
    u_xlat34 = u_xlat40 * u_xlat34 + 1.0;
    u_xlat34 = float(1.0) / u_xlat34;
    u_xlat34 = (-u_xlat34) + 1.0;
    u_xlat2.xzw = (-u_xlat7.xyz) * vec3(u_xlat34) + u_xlat2.xzw;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat2.xzw : u_xlat1.xyz;
    u_xlat16_38 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlatb34 = u_xlat16_38>=9.99999997e-07;
    if(u_xlatb34){
        u_xlat16_38 = inversesqrt(u_xlat16_38);
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_38);
        u_xlat34 = _VelocityOrientAxis + 0.5;
        u_xlati34 = int(u_xlat34);
        u_xlatb2 = equal(ivec4(u_xlati34), ivec4(0, 1, 2, 3));
        u_xlatb7 = u_xlati34==4;
        u_xlat16_8.xyz = (u_xlatb2.w) ? vec3(0.0, -1.0, 0.0) : vec3(0.0, 0.0, 1.0);
        u_xlatb35 = u_xlatb2.w || u_xlatb7;
        u_xlat16_8.xyz = (u_xlatb2.z) ? vec3(0.0, 1.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb24 = u_xlatb35 || u_xlatb2.z;
        u_xlat16_8.xyz = (u_xlatb2.y) ? vec3(-1.0, 0.0, 0.0) : u_xlat16_8.xyz;
        u_xlatb13 = u_xlatb24 || u_xlatb2.y;
        u_xlat16_8.xyz = (int(u_xlati34) != 0) ? u_xlat16_8.xyz : vec3(1.0, 0.0, 0.0);
        u_xlatb34 = u_xlatb13 || u_xlatb2.x;
        u_xlat16_8.xyz = (bool(u_xlatb34)) ? u_xlat16_8.xyz : vec3(0.0, 0.0, -1.0);
        u_xlat16_9.xyz = u_xlat16_6.zxy * u_xlat16_8.xyz;
        u_xlat16_9.xyz = u_xlat16_8.zxy * u_xlat16_6.xyz + (-u_xlat16_9.xyz);
        u_xlat16_9.xyz = u_xlat16_8.yzx * vec3(u_xlat16_39) + u_xlat16_9.xyz;
        u_xlat16_38 = dot(u_xlat16_8.xyz, u_xlat16_6.xyz);
        u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_8.xyz = u_xlat16_9.zxy * vec3(u_xlat16_39) + u_xlat16_8.xyz;
        u_xlat16_10.xyz = u_xlat16_5.xyz * u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_5.zxy * u_xlat16_9.yzx + (-u_xlat16_10.xyz);
        u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = u_xlat16_4.yzx * u_xlat16_8.zxy;
        u_xlat16_9.xyz = u_xlat16_8.yzx * u_xlat16_4.zxy + (-u_xlat16_9.xyz);
        u_xlat16_4.x = dot(u_xlat16_8.xyz, u_xlat16_4.xyz);
        u_xlat34 = u_xlat16_4.x + 1.0;
        u_xlatb2.x = u_xlat34<9.99999975e-05;
        u_xlatb13 = abs(u_xlat16_8.z)<abs(u_xlat16_8.x);
        u_xlat16_4.xy = u_xlat16_8.yx * vec2(-1.0, 1.0);
        u_xlat16_4.z = 0.0;
        u_xlat16_10.x = 0.0;
        u_xlat16_10.yz = u_xlat16_8.zy * vec2(-1.0, 1.0);
        u_xlat16_4.xyz = (bool(u_xlatb13)) ? u_xlat16_4.xyz : u_xlat16_10.xyz;
        u_xlat16_7.xyz = (u_xlatb2.x) ? u_xlat16_4.xyz : u_xlat16_9.xyz;
        u_xlat16_7.w = (u_xlatb2.x) ? 0.0 : u_xlat34;
        u_xlat16_4.x = dot(u_xlat16_7, u_xlat16_7);
        u_xlat16_4.x = inversesqrt(u_xlat16_4.x);
        u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat1.xyz;
        u_xlat16_4.xyz = u_xlat1.zxy * u_xlat16_6.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat1.yzx * vec3(u_xlat16_39) + u_xlat16_4.xyz;
        u_xlat16_38 = dot(u_xlat1.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-vec3(u_xlat16_38)) * u_xlat16_5.yzx;
        u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(u_xlat16_39) + u_xlat16_6.xyz;
        u_xlat16_8.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
        u_xlat16_4.xyz = u_xlat16_5.zxy * u_xlat16_4.yzx + (-u_xlat16_8.xyz);
        u_xlat16_4.xyz = u_xlat16_4.xyz + u_xlat16_6.xyz;
        u_xlat16_5 = u_xlat16_2 * vec4(-1.0, -1.0, -1.0, 1.0);
        u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_5.zxy;
        u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_5.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_4.yzx * u_xlat16_5.www + u_xlat16_6.xyz;
        u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_5.xyz);
        u_xlat16_4.xyz = u_xlat16_2.xyz * (-u_xlat16_4.xxx);
        u_xlat16_4.xyz = u_xlat16_6.zxy * u_xlat16_2.www + u_xlat16_4.xyz;
        u_xlat16_5.xyz = u_xlat16_2.zxy * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_2.yzx * u_xlat16_6.yzx + (-u_xlat16_5.xyz);
        u_xlat16_1.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
        u_xlat1.xyz = u_xlat16_1.xyz;
    }
    u_xlat0.xyz = u_xlat1.xyz * vec3(u_xlat16_37) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_LocalToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_LocalToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_LocalToWorld[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4_LocalToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat33 = (-u_xlat33) + 1.0;
    u_xlat33 = u_xlat33 * _ColorMode;
    u_xlat1 = (-_Color) + _Color2;
    u_xlat1 = vec4(u_xlat33) * u_xlat1 + _Color;
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat1.xyz;
    vs_COLOR0.xyz = u_xlat3.xyz * u_xlat16_4.xyz;
    vs_COLOR0.w = u_xlat3.w * u_xlat1.w;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump float _EnableMainPremultAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
layout(location = 0) in highp vec2 vs_TEXCOORD0;
layout(location = 1) in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_10 = u_xlat16_0.w * vs_COLOR0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_10) * u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_10;
    u_xlatb0 = 0.5<_EnableMainPremultAlpha;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
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
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROCEDURAL_INSTANCING_ON" "_COLOR_HDR_" }
Local Keywords { "_VAT_INTERPOLATE" "_VELOCITYORIENT_ON" "_VELOCITYSTRETCH_ON" }
""
}
}
}
}
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}