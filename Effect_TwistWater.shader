//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/TwistWater" {
Properties {

[Header(Inside Base Draw ____________________________________________________________________________________________________________)] [Space(10)] _MatcapTex ("Matcap Texture", 2D) = "white" { }

_matcapTileOffset ("matcap平铺偏移", Vector) = (1,1,0,0)

_MatcapAngle ("matcap旋转角度", Range(0, 360)) = 0.0

_matcapPowValue ("matcap对比", Range(0, 16)) = 1.0

_MatcapColor ("Matcap Color", Color) = (1,1,1,1)

[Header(Grandient Tint)] _baseColor1 ("渐变颜色 1", Color) = (1,1,1,1)

_baseColor2 ("渐变颜色 2", Color) = (1,1,1,1)

_GradientPower ("基于UV Y轴的插值对比", Range(0, 8)) = 1.0

_noiseTex ("Wave Noise Tex 1", 2D) = "black" { }

_noiseDistorValue ("Noise Distortion Value", Float) = 0.30000001192092896

_noiseTex2 ("Wave Noise Tex 2", 2D) = "black" { }

_noiseDistorValue2 ("Noise Distortion Value", Float) = 0.30000001192092896

_WobbleStrength ("Wobble Strength", Vector) = (0.05,0.05,0,0)

[Space(10)] [Header(Out Foam Draw____________________________________________________________________________________________________________)] [Space(10)] [Header(Outer Shell Foam)] _ShellExtrude ("Shell Extrude (挤出距离)", Float) = 0.029999999329447746

_OutlineWidthTex ("挤出宽度Mask", 2D) = "white" { }

_ShellColor ("Shell Color A通道控制泡沫的半透明", Color) = (1,1,1,1)

_ShellColor2 ("Shell Color 2", Color) = (1,1,1,1)

_TwistTexture ("泡沫形状 Offset是移动的速度", 2D) = "white" { }

_ShellClip ("Shell Clip Value (外壳镂空阈值)", Range(0, 1)) = 0.5

_FoamCutValue ("Foam Cut Value (泡沫头部裁剪阈值)", Range(0, 1)) = 0.9800000190734863

_FoamCutSoftRange ("Foam Cut Soft Range (泡沫头部裁剪过渡范围)", Range(0, 0.1)) = 0.009999999776482582

_TwistNoiseTexture ("扰动贴图 Offset是移动的速度", 2D) = "white" { }

_effectByNoise ("基于noise的扰动强度", Float) = 0.03500000014901161

[Header(Semless Spiral)] [Space(10)] [Toggle(_USE_SEAMLESS_SPIRAL)] _useSemlessSpiral ("Use Semless Spiral (使用无缝螺旋)", Float) = 1.0

_SpinSpeed ("Spin Speed (周向旋转)", Float) = 0.30000001192092896

_FlowSpeed ("Flow Speed (沿高度流动)", Float) = 0.30000001192092896

_AngularTiling ("Angular Tiling (绕圈次数,整数!)", Float) = 4.0

_HeightTiling ("Height Tiling", Float) = 2.0

_Twist ("Twist (斜向螺旋强度)", Float) = 1.0

[Header(Shell Vertex Wave)] _WaveAmp ("Wave Amplitude (顶点起伏幅度)", Float) = 0.019999999552965164

_WaveFreq ("Wave Frequency (空间频率)", Float) = 6.0

_WaveSpeed ("Wave Speed (动画速度)", Float) = 2.0

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 34847
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _noiseTex2_ST;
uniform 	vec4 _WobbleStrength;
uniform 	vec4 _noiseTex_ST;
uniform 	mediump float _noiseDistorValue;
uniform 	mediump float _noiseDistorValue2;
uniform 	mediump float _matcapPowValue;
uniform 	mediump vec4 _MatcapColor;
uniform 	float _MatcapAngle;
uniform 	vec4 _matcapTileOffset;
uniform 	mediump vec4 _baseColor1;
uniform 	mediump vec4 _baseColor2;
uniform 	mediump float _GradientPower;
UNITY_LOCATION(0) uniform mediump sampler2D _noiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _noiseTex2;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
float u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_12 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = u_xlat16_12 + u_xlat16_12;
    u_xlat16_0.xyz = u_xlat16_0.xyz * (-vec3(u_xlat16_12)) + u_xlat1.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_8.x = u_xlat16_0.z + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x + u_xlat16_12;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_0.xy = u_xlat16_0.yx / u_xlat16_8.xx;
    u_xlat1.x = _MatcapAngle * 0.0174532924;
    u_xlat2 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat16_8.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat16_3.x = u_xlat16_0.y * u_xlat2 + (-u_xlat16_8.x);
    u_xlat16_3.y = u_xlat16_0.x * u_xlat2 + u_xlat16_8.y;
    u_xlat1.xy = u_xlat16_3.xy * _matcapTileOffset.xy + _matcapTileOffset.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex2_ST.xy + _noiseTex2_ST.zw;
    u_xlat9.xy = _WobbleStrength.xy * _Time.yy + u_xlat9.xy;
    u_xlat16_9 = texture(_noiseTex2, u_xlat9.xy).x;
    u_xlat16_0.x = u_xlat16_9 + -0.5;
    u_xlat16_0.x = u_xlat16_0.x * _noiseDistorValue2;
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex_ST.xy + _noiseTex_ST.zw;
    u_xlat9.xy = _WobbleStrength.zw * _Time.yy + u_xlat9.xy;
    u_xlat16_9 = texture(_noiseTex, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat16_9 + -0.5;
    u_xlat16_0.x = u_xlat16_4 * _noiseDistorValue + u_xlat16_0.x;
    u_xlat16_0.xy = u_xlat16_0.xx + u_xlat1.xy;
    u_xlat0 = texture(_MatcapTex, u_xlat16_0.xy);
    u_xlat16_3.xyz = log2(u_xlat0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_matcapPowValue, _matcapPowValue, _matcapPowValue));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MatcapColor.xyz;
    u_xlat1.x = log2(vs_TEXCOORD0.w);
    u_xlat1.x = u_xlat1.x * _GradientPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat5.xyz = (-_baseColor1.xyz) + _baseColor2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + _baseColor1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _noiseTex2_ST;
uniform 	vec4 _WobbleStrength;
uniform 	vec4 _noiseTex_ST;
uniform 	mediump float _noiseDistorValue;
uniform 	mediump float _noiseDistorValue2;
uniform 	mediump float _matcapPowValue;
uniform 	mediump vec4 _MatcapColor;
uniform 	float _MatcapAngle;
uniform 	vec4 _matcapTileOffset;
uniform 	mediump vec4 _baseColor1;
uniform 	mediump vec4 _baseColor2;
uniform 	mediump float _GradientPower;
UNITY_LOCATION(0) uniform mediump sampler2D _noiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _noiseTex2;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
float u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_12 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = u_xlat16_12 + u_xlat16_12;
    u_xlat16_0.xyz = u_xlat16_0.xyz * (-vec3(u_xlat16_12)) + u_xlat1.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_8.x = u_xlat16_0.z + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x + u_xlat16_12;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_0.xy = u_xlat16_0.yx / u_xlat16_8.xx;
    u_xlat1.x = _MatcapAngle * 0.0174532924;
    u_xlat2 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat16_8.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat16_3.x = u_xlat16_0.y * u_xlat2 + (-u_xlat16_8.x);
    u_xlat16_3.y = u_xlat16_0.x * u_xlat2 + u_xlat16_8.y;
    u_xlat1.xy = u_xlat16_3.xy * _matcapTileOffset.xy + _matcapTileOffset.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex2_ST.xy + _noiseTex2_ST.zw;
    u_xlat9.xy = _WobbleStrength.xy * _Time.yy + u_xlat9.xy;
    u_xlat16_9 = texture(_noiseTex2, u_xlat9.xy).x;
    u_xlat16_0.x = u_xlat16_9 + -0.5;
    u_xlat16_0.x = u_xlat16_0.x * _noiseDistorValue2;
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex_ST.xy + _noiseTex_ST.zw;
    u_xlat9.xy = _WobbleStrength.zw * _Time.yy + u_xlat9.xy;
    u_xlat16_9 = texture(_noiseTex, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat16_9 + -0.5;
    u_xlat16_0.x = u_xlat16_4 * _noiseDistorValue + u_xlat16_0.x;
    u_xlat16_0.xy = u_xlat16_0.xx + u_xlat1.xy;
    u_xlat0 = texture(_MatcapTex, u_xlat16_0.xy);
    u_xlat16_3.xyz = log2(u_xlat0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_matcapPowValue, _matcapPowValue, _matcapPowValue));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MatcapColor.xyz;
    u_xlat1.x = log2(vs_TEXCOORD0.w);
    u_xlat1.x = u_xlat1.x * _GradientPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat5.xyz = (-_baseColor1.xyz) + _baseColor2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + _baseColor1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _noiseTex2_ST;
uniform 	vec4 _WobbleStrength;
uniform 	vec4 _noiseTex_ST;
uniform 	mediump float _noiseDistorValue;
uniform 	mediump float _noiseDistorValue2;
uniform 	mediump float _matcapPowValue;
uniform 	mediump vec4 _MatcapColor;
uniform 	float _MatcapAngle;
uniform 	vec4 _matcapTileOffset;
uniform 	mediump vec4 _baseColor1;
uniform 	mediump vec4 _baseColor2;
uniform 	mediump float _GradientPower;
uniform lowp sampler2D _noiseTex;
uniform lowp sampler2D _noiseTex2;
uniform lowp sampler2D _MatcapTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
float u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
lowp float u_xlat10_9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_12 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = u_xlat16_12 + u_xlat16_12;
    u_xlat16_0.xyz = u_xlat16_0.xyz * (-vec3(u_xlat16_12)) + u_xlat1.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_8.x = u_xlat16_0.z + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x + u_xlat16_12;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_0.xy = u_xlat16_0.yx / u_xlat16_8.xx;
    u_xlat1.x = _MatcapAngle * 0.0174532924;
    u_xlat2 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat16_8.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat16_3.x = u_xlat16_0.y * u_xlat2 + (-u_xlat16_8.x);
    u_xlat16_3.y = u_xlat16_0.x * u_xlat2 + u_xlat16_8.y;
    u_xlat1.xy = u_xlat16_3.xy * _matcapTileOffset.xy + _matcapTileOffset.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex2_ST.xy + _noiseTex2_ST.zw;
    u_xlat9.xy = _WobbleStrength.xy * _Time.yy + u_xlat9.xy;
    u_xlat10_9 = texture2D(_noiseTex2, u_xlat9.xy).x;
    u_xlat16_0.x = u_xlat10_9 + -0.5;
    u_xlat16_0.x = u_xlat16_0.x * _noiseDistorValue2;
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex_ST.xy + _noiseTex_ST.zw;
    u_xlat9.xy = _WobbleStrength.zw * _Time.yy + u_xlat9.xy;
    u_xlat10_9 = texture2D(_noiseTex, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat10_9 + -0.5;
    u_xlat16_0.x = u_xlat16_4 * _noiseDistorValue + u_xlat16_0.x;
    u_xlat16_0.xy = u_xlat16_0.xx + u_xlat1.xy;
    u_xlat0 = texture2D(_MatcapTex, u_xlat16_0.xy);
    u_xlat16_3.xyz = log2(u_xlat0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_matcapPowValue, _matcapPowValue, _matcapPowValue));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MatcapColor.xyz;
    u_xlat1.x = log2(vs_TEXCOORD0.w);
    u_xlat1.x = u_xlat1.x * _GradientPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat5.xyz = (-_baseColor1.xyz) + _baseColor2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + _baseColor1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat1.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _noiseTex2_ST;
uniform 	vec4 _WobbleStrength;
uniform 	vec4 _noiseTex_ST;
uniform 	mediump float _noiseDistorValue;
uniform 	mediump float _noiseDistorValue2;
uniform 	mediump float _matcapPowValue;
uniform 	mediump vec4 _MatcapColor;
uniform 	float _MatcapAngle;
uniform 	vec4 _matcapTileOffset;
uniform 	mediump vec4 _baseColor1;
uniform 	mediump vec4 _baseColor2;
uniform 	mediump float _GradientPower;
uniform lowp sampler2D _noiseTex;
uniform lowp sampler2D _noiseTex2;
uniform lowp sampler2D _MatcapTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
float u_xlat2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
lowp float u_xlat10_9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_12 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = u_xlat16_12 + u_xlat16_12;
    u_xlat16_0.xyz = u_xlat16_0.xyz * (-vec3(u_xlat16_12)) + u_xlat1.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xy, u_xlat16_0.xy);
    u_xlat16_8.x = u_xlat16_0.z + 1.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x + u_xlat16_12;
    u_xlat16_8.x = sqrt(u_xlat16_8.x);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat16_0.xy = u_xlat16_0.yx / u_xlat16_8.xx;
    u_xlat1.x = _MatcapAngle * 0.0174532924;
    u_xlat2 = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat16_8.xy = u_xlat16_0.xy * u_xlat1.xx;
    u_xlat16_3.x = u_xlat16_0.y * u_xlat2 + (-u_xlat16_8.x);
    u_xlat16_3.y = u_xlat16_0.x * u_xlat2 + u_xlat16_8.y;
    u_xlat1.xy = u_xlat16_3.xy * _matcapTileOffset.xy + _matcapTileOffset.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex2_ST.xy + _noiseTex2_ST.zw;
    u_xlat9.xy = _WobbleStrength.xy * _Time.yy + u_xlat9.xy;
    u_xlat10_9 = texture2D(_noiseTex2, u_xlat9.xy).x;
    u_xlat16_0.x = u_xlat10_9 + -0.5;
    u_xlat16_0.x = u_xlat16_0.x * _noiseDistorValue2;
    u_xlat9.xy = vs_TEXCOORD0.xy * _noiseTex_ST.xy + _noiseTex_ST.zw;
    u_xlat9.xy = _WobbleStrength.zw * _Time.yy + u_xlat9.xy;
    u_xlat10_9 = texture2D(_noiseTex, u_xlat9.xy).x;
    u_xlat16_4 = u_xlat10_9 + -0.5;
    u_xlat16_0.x = u_xlat16_4 * _noiseDistorValue + u_xlat16_0.x;
    u_xlat16_0.xy = u_xlat16_0.xx + u_xlat1.xy;
    u_xlat0 = texture2D(_MatcapTex, u_xlat16_0.xy);
    u_xlat16_3.xyz = log2(u_xlat0.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_matcapPowValue, _matcapPowValue, _matcapPowValue));
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MatcapColor.xyz;
    u_xlat1.x = log2(vs_TEXCOORD0.w);
    u_xlat1.x = u_xlat1.x * _GradientPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat5.xyz = (-_baseColor1.xyz) + _baseColor2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat5.xyz + _baseColor1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat1.xyz;
    SV_Target0 = u_xlat0;
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
}
}
 Pass {
 Name "SHELL"
  LOD 100
  Tags { "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 121827
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineWidthTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = textureLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat4.xy = _Time.yy * _TwistTexture_ST.zw;
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _TwistTexture_ST.xy + u_xlat4.xy;
    u_xlat16_0 = texture(_TwistTexture, u_xlat0.xy).x;
    u_xlat2 = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat2) + _FoamCutValue;
    u_xlat2 = (-u_xlat2) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2 = u_xlat4.x * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2 * -2.0 + 3.0;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat4.x;
    u_xlat16_1 = u_xlat2 * u_xlat16_0;
    u_xlat16_3.x = (-u_xlat16_0) * u_xlat2 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-0.0270000007>=vs_TEXCOORD1.z);
#else
    u_xlatb0 = -0.0270000007>=vs_TEXCOORD1.z;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_3.x + u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + (-_ShellClip);
    u_xlat16_3.x = u_xlat16_1 * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat2 * u_xlat16_3.x;
    SV_Target0.w = u_xlat16_3.x * _ShellColor.w;
    u_xlat16_3.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + _ShellColor2.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineWidthTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = textureLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat4.xy = _Time.yy * _TwistTexture_ST.zw;
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _TwistTexture_ST.xy + u_xlat4.xy;
    u_xlat16_0 = texture(_TwistTexture, u_xlat0.xy).x;
    u_xlat2 = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat2) + _FoamCutValue;
    u_xlat2 = (-u_xlat2) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2 = u_xlat4.x * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat2 * -2.0 + 3.0;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat4.x;
    u_xlat16_1 = u_xlat2 * u_xlat16_0;
    u_xlat16_3.x = (-u_xlat16_0) * u_xlat2 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(-0.0270000007>=vs_TEXCOORD1.z);
#else
    u_xlatb0 = -0.0270000007>=vs_TEXCOORD1.z;
#endif
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_3.x + u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + (-_ShellClip);
    u_xlat16_3.x = u_xlat16_1 * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat2 * u_xlat16_3.x;
    SV_Target0.w = u_xlat16_3.x * _ShellColor.w;
    u_xlat16_3.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + _ShellColor2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
uniform lowp sampler2D _OutlineWidthTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = texture2DLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
uniform lowp sampler2D _TwistNoiseTexture;
uniform lowp sampler2D _TwistTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat4.xy = _Time.yy * _TwistTexture_ST.zw;
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _TwistTexture_ST.xy + u_xlat4.xy;
    u_xlat10_0 = texture2D(_TwistTexture, u_xlat0.xy).x;
    u_xlat2 = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat2) + _FoamCutValue;
    u_xlat2 = (-u_xlat2) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2 = u_xlat4.x * u_xlat2;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat4.x = u_xlat2 * -2.0 + 3.0;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat4.x;
    u_xlat16_1 = u_xlat2 * u_xlat10_0;
    u_xlat16_3.x = (-u_xlat10_0) * u_xlat2 + 1.0;
    u_xlatb0 = -0.0270000007>=vs_TEXCOORD1.z;
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_3.x + u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + (-_ShellClip);
    u_xlat16_3.x = u_xlat16_1 * 100.0;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat2 * u_xlat16_3.x;
    SV_Target0.w = u_xlat16_3.x * _ShellColor.w;
    u_xlat16_3.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + _ShellColor2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
uniform lowp sampler2D _OutlineWidthTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = texture2DLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
uniform lowp sampler2D _TwistNoiseTexture;
uniform lowp sampler2D _TwistTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
mediump float u_xlat16_1;
float u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_5;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat4.xy = _Time.yy * _TwistTexture_ST.zw;
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _TwistTexture_ST.xy + u_xlat4.xy;
    u_xlat10_0 = texture2D(_TwistTexture, u_xlat0.xy).x;
    u_xlat2 = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat2) + _FoamCutValue;
    u_xlat2 = (-u_xlat2) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat2 = u_xlat4.x * u_xlat2;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat4.x = u_xlat2 * -2.0 + 3.0;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat4.x;
    u_xlat16_1 = u_xlat2 * u_xlat10_0;
    u_xlat16_3.x = (-u_xlat10_0) * u_xlat2 + 1.0;
    u_xlatb0 = -0.0270000007>=vs_TEXCOORD1.z;
    u_xlat16_5 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_1 = u_xlat16_5 * u_xlat16_3.x + u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 + (-_ShellClip);
    u_xlat16_3.x = u_xlat16_1 * 100.0;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat2 * u_xlat16_3.x;
    SV_Target0.w = u_xlat16_3.x * _ShellColor.w;
    u_xlat16_3.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_3.xyz + _ShellColor2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineWidthTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = textureLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _FlowSpeed;
uniform 	float _SpinSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
mediump float u_xlat16_11;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * _SpinSpeed + u_xlat0.x;
    u_xlat0.z = u_xlat0.x + 0.5;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat12 = u_xlat0.z * _Twist + u_xlat0.y;
    u_xlat4.x = u_xlat0.x * _Twist + u_xlat0.y;
    u_xlat1.x = u_xlat0.z * _AngularTiling;
    u_xlat8.x = _Time.y * _FlowSpeed;
    u_xlat1.z = u_xlat12 * _HeightTiling + u_xlat8.x;
    u_xlat2.z = u_xlat4.x * _HeightTiling + u_xlat8.x;
    u_xlat4.xy = u_xlat1.xz * _TwistTexture_ST.xy;
    u_xlat16_4 = texture(_TwistTexture, u_xlat4.xy).x;
    u_xlat2.x = u_xlat0.x * _AngularTiling;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = abs(u_xlat0.x) + -0.25;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = u_xlat2.xz * _TwistTexture_ST.xy;
    u_xlat16_8 = texture(_TwistTexture, u_xlat8.xy).x;
    u_xlat16_3 = (-u_xlat16_8) + u_xlat16_4;
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_3 = u_xlat0.x * u_xlat16_3 + u_xlat16_8;
    u_xlat0.x = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat0.x) + _FoamCutValue;
    u_xlat0.x = (-u_xlat0.x) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat16_3;
    u_xlat16_3 = (-u_xlat16_3) * u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(-0.0270000007>=vs_TEXCOORD1.z);
#else
    u_xlatb4 = -0.0270000007>=vs_TEXCOORD1.z;
#endif
    u_xlat16_11 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_3 = u_xlat16_11 * u_xlat16_3 + u_xlat16_7.x;
    u_xlat16_3 = u_xlat16_3 + (-_ShellClip);
    u_xlat16_7.x = u_xlat16_3 * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat0.x * u_xlat16_7.x;
    SV_Target0.w = u_xlat16_7.x * _ShellColor.w;
    u_xlat16_7.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz + _ShellColor2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
UNITY_LOCATION(2) uniform mediump sampler2D _OutlineWidthTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = textureLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _FlowSpeed;
uniform 	float _SpinSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
UNITY_LOCATION(0) uniform mediump sampler2D _TwistNoiseTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _TwistTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
mediump float u_xlat16_11;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat16_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * _SpinSpeed + u_xlat0.x;
    u_xlat0.z = u_xlat0.x + 0.5;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat12 = u_xlat0.z * _Twist + u_xlat0.y;
    u_xlat4.x = u_xlat0.x * _Twist + u_xlat0.y;
    u_xlat1.x = u_xlat0.z * _AngularTiling;
    u_xlat8.x = _Time.y * _FlowSpeed;
    u_xlat1.z = u_xlat12 * _HeightTiling + u_xlat8.x;
    u_xlat2.z = u_xlat4.x * _HeightTiling + u_xlat8.x;
    u_xlat4.xy = u_xlat1.xz * _TwistTexture_ST.xy;
    u_xlat16_4 = texture(_TwistTexture, u_xlat4.xy).x;
    u_xlat2.x = u_xlat0.x * _AngularTiling;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = abs(u_xlat0.x) + -0.25;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = u_xlat2.xz * _TwistTexture_ST.xy;
    u_xlat16_8 = texture(_TwistTexture, u_xlat8.xy).x;
    u_xlat16_3 = (-u_xlat16_8) + u_xlat16_4;
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_3 = u_xlat0.x * u_xlat16_3 + u_xlat16_8;
    u_xlat0.x = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat0.x) + _FoamCutValue;
    u_xlat0.x = (-u_xlat0.x) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat16_3;
    u_xlat16_3 = (-u_xlat16_3) * u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(-0.0270000007>=vs_TEXCOORD1.z);
#else
    u_xlatb4 = -0.0270000007>=vs_TEXCOORD1.z;
#endif
    u_xlat16_11 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_3 = u_xlat16_11 * u_xlat16_3 + u_xlat16_7.x;
    u_xlat16_3 = u_xlat16_3 + (-_ShellClip);
    u_xlat16_7.x = u_xlat16_3 * 100.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat0.x * u_xlat16_7.x;
    SV_Target0.w = u_xlat16_7.x * _ShellColor.w;
    u_xlat16_7.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz + _ShellColor2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
uniform lowp sampler2D _OutlineWidthTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = texture2DLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	float _FlowSpeed;
uniform 	float _SpinSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
uniform lowp sampler2D _TwistNoiseTexture;
uniform lowp sampler2D _TwistTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
mediump float u_xlat16_11;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * _SpinSpeed + u_xlat0.x;
    u_xlat0.z = u_xlat0.x + 0.5;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat12 = u_xlat0.z * _Twist + u_xlat0.y;
    u_xlat4.x = u_xlat0.x * _Twist + u_xlat0.y;
    u_xlat1.x = u_xlat0.z * _AngularTiling;
    u_xlat8.x = _Time.y * _FlowSpeed;
    u_xlat1.z = u_xlat12 * _HeightTiling + u_xlat8.x;
    u_xlat2.z = u_xlat4.x * _HeightTiling + u_xlat8.x;
    u_xlat4.xy = u_xlat1.xz * _TwistTexture_ST.xy;
    u_xlat10_4 = texture2D(_TwistTexture, u_xlat4.xy).x;
    u_xlat2.x = u_xlat0.x * _AngularTiling;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = abs(u_xlat0.x) + -0.25;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = u_xlat2.xz * _TwistTexture_ST.xy;
    u_xlat10_8 = texture2D(_TwistTexture, u_xlat8.xy).x;
    u_xlat16_3 = (-u_xlat10_8) + u_xlat10_4;
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_3 = u_xlat0.x * u_xlat16_3 + u_xlat10_8;
    u_xlat0.x = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat0.x) + _FoamCutValue;
    u_xlat0.x = (-u_xlat0.x) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat16_3;
    u_xlat16_3 = (-u_xlat16_3) * u_xlat0.x + 1.0;
    u_xlatb4 = -0.0270000007>=vs_TEXCOORD1.z;
    u_xlat16_11 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_3 = u_xlat16_11 * u_xlat16_3 + u_xlat16_7.x;
    u_xlat16_3 = u_xlat16_3 + (-_ShellClip);
    u_xlat16_7.x = u_xlat16_3 * 100.0;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_7.x = u_xlat0.x * u_xlat16_7.x;
    SV_Target0.w = u_xlat16_7.x * _ShellColor.w;
    u_xlat16_7.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz + _ShellColor2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _ShellExtrude;
uniform 	mediump float _WaveAmp;
uniform 	float _WaveFreq;
uniform 	float _WaveSpeed;
uniform lowp sampler2D _OutlineWidthTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = in_POSITION0.y + in_POSITION0.x;
    u_xlat0.x = u_xlat0.x + in_POSITION0.z;
    u_xlat0.x = u_xlat0.x * _WaveFreq;
    u_xlat0.x = _Time.y * _WaveSpeed + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WaveAmp + _ShellExtrude;
    u_xlat2.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * in_NORMAL0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6 = texture2DLod(_OutlineWidthTex, in_TEXCOORD0.xy, 0.0).x;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	float _FlowSpeed;
uniform 	float _SpinSpeed;
uniform 	float _AngularTiling;
uniform 	float _HeightTiling;
uniform 	mediump float _Twist;
uniform 	mediump vec4 _ShellColor;
uniform 	mediump vec4 _ShellColor2;
uniform 	mediump float _ShellClip;
uniform 	vec4 _TwistTexture_ST;
uniform 	vec4 _TwistNoiseTexture_ST;
uniform 	mediump float _effectByNoise;
uniform 	float _FoamCutValue;
uniform 	float _FoamCutSoftRange;
uniform lowp sampler2D _TwistNoiseTexture;
uniform lowp sampler2D _TwistTexture;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
vec2 u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
mediump vec3 u_xlat16_7;
vec2 u_xlat8;
lowp float u_xlat10_8;
mediump float u_xlat16_11;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _TwistNoiseTexture_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = vs_TEXCOORD0.xy * _TwistNoiseTexture_ST.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_TwistNoiseTexture, u_xlat0.xy).x;
    u_xlat0.xy = vec2(u_xlat10_0) * vec2(_effectByNoise) + vs_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * _SpinSpeed + u_xlat0.x;
    u_xlat0.z = u_xlat0.x + 0.5;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat12 = u_xlat0.z * _Twist + u_xlat0.y;
    u_xlat4.x = u_xlat0.x * _Twist + u_xlat0.y;
    u_xlat1.x = u_xlat0.z * _AngularTiling;
    u_xlat8.x = _Time.y * _FlowSpeed;
    u_xlat1.z = u_xlat12 * _HeightTiling + u_xlat8.x;
    u_xlat2.z = u_xlat4.x * _HeightTiling + u_xlat8.x;
    u_xlat4.xy = u_xlat1.xz * _TwistTexture_ST.xy;
    u_xlat10_4 = texture2D(_TwistTexture, u_xlat4.xy).x;
    u_xlat2.x = u_xlat0.x * _AngularTiling;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = abs(u_xlat0.x) + -0.25;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat8.xy = u_xlat2.xz * _TwistTexture_ST.xy;
    u_xlat10_8 = texture2D(_TwistTexture, u_xlat8.xy).x;
    u_xlat16_3 = (-u_xlat10_8) + u_xlat10_4;
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_3 = u_xlat0.x * u_xlat16_3 + u_xlat10_8;
    u_xlat0.x = _FoamCutValue + _FoamCutSoftRange;
    u_xlat4.x = (-u_xlat0.x) + _FoamCutValue;
    u_xlat0.x = (-u_xlat0.x) + vs_TEXCOORD0.y;
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.x;
    u_xlat16_7.x = u_xlat0.x * u_xlat16_3;
    u_xlat16_3 = (-u_xlat16_3) * u_xlat0.x + 1.0;
    u_xlatb4 = -0.0270000007>=vs_TEXCOORD1.z;
    u_xlat16_11 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_3 = u_xlat16_11 * u_xlat16_3 + u_xlat16_7.x;
    u_xlat16_3 = u_xlat16_3 + (-_ShellClip);
    u_xlat16_7.x = u_xlat16_3 * 100.0;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_7.x = u_xlat0.x * u_xlat16_7.x;
    SV_Target0.w = u_xlat16_7.x * _ShellColor.w;
    u_xlat16_7.xyz = _ShellColor.xyz + (-_ShellColor2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_7.xyz + _ShellColor2.xyz;
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
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_SEAMLESS_SPIRAL" }
""
}
}
}
}
}