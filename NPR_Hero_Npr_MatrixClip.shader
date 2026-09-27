//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_Npr_MatrixClip" {
Properties {

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("剔除模式", Float) = 0.0

[Toggle(_USE_FIXED_ALPHA)] _useFixedAlpha ("使用固定Alpha", Float) = 0.0

[Toggle] _inverseUv1 ("反转第二套UV", Float) = 0.0

[Header(Base Params_______________________________________________________________________________________________)] _DiffuseTex ("漫反射贴图", 2D) = "white" { }

_Color ("颜色叠加", Color) = (1,1,1,1)

_Cutoff ("透明裁剪阈值", Range(0, 1)) = 0.3330000042915344

[Space(15)] [Header(Dissolve And Noise________________________________________________________________________)] [Space(10)] _DissolveMask ("noise扰动Mask", 2D) = "white" { }

_DissolveTex ("溶解 只有Offset有效", 2D) = "white" { }

_DSChannel ("溶解 G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

_dissolveScale ("溶解强度", Float) = 1.0

_DissolveStep ("溶解", Range(0, 1)) = 0.5

_DissolveSoftSize ("溶解软硬", Range(0, 0.5)) = 0.10000000149011612

_NoiseTex ("Noise 只有Offset有效", 2D) = "black" { }

[Toggle] _NoiseUnEffectDiff ("Noise不影响主贴图", Float) = 0.0

_GChannel ("noise G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

_NoiseXStreng ("noise 扭曲强度U", Range(-10, 10)) = 0.0

_NoiseYStreng ("noise 扭曲强度V", Range(-10, 10)) = 0.0

[Space(10)] _speedDiffFromUV3 ("基于UV3 X轴的扰动速度差异,用整数", Float) = 1.0

[Space(10)] [Header(Vertex Animation_______________________________________________________________________________________________)] [Space(10)] _animationGradientPower ("动画渐变曲线", Range(0.1, 8)) = 1.0

_WindStrength ("抖动振幅", Range(0, 2)) = 0.30000001192092896

_WindFrequency ("抖动频率,高频率需要面数达到一定精度才有效果", Range(0, 21)) = 2.0

_WindSpeed ("抖动速度", Range(0, 10)) = 1.0

[Space(10)] [Header(Emission_______________________________________________________________________________________________)] _EmissionColor ("自发光颜色", Color) = (0,0,0,1)

_EmissionMap ("自发光贴图", 2D) = "white" { }

}
SubShader {
 Pass {
 Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 11757
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _DiffuseTex_ST;
uniform 	mediump float _WindStrength;
uniform 	mediump float _WindFrequency;
uniform 	mediump float _WindSpeed;
uniform 	mediump float _inverseUv1;
uniform 	float _animationGradientPower;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec2 in_TEXCOORD2;
out mediump vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = in_COLOR0.x * -0.819000006;
    u_xlat3 = (-in_TEXCOORD2.x) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_inverseUv1);
#else
    u_xlatb3 = 0.5<_inverseUv1;
#endif
    u_xlat16_1 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat16_1 = (u_xlatb3) ? u_xlat16_1 : in_TEXCOORD1.y;
    u_xlat3 = log2(u_xlat16_1);
    vs_TEXCOORD0.w = u_xlat16_1;
    u_xlat3 = u_xlat3 * _animationGradientPower;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat3 * _WindFrequency + u_xlat0.x;
    u_xlat16_1 = min(u_xlat3, 1.0);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat0.x = _Time.y * _WindSpeed + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 6.28318024;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat0.x;
    u_xlat16_1 = u_xlat16_1 * _WindStrength;
    u_xlat0.xyz = vec3(u_xlat16_1) * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat2.xy = in_TEXCOORD0.xy * _DiffuseTex_ST.xy + _DiffuseTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy;
    vs_TEXCOORD0.z = in_TEXCOORD1.x;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
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
vec4 ImmCB_0[16];
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform 	float _speedDiffFromUV3;
uniform 	mediump vec4 _EmissionColor;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _GChannel;
uniform 	vec4 _DSChannel;
uniform 	float _dissolveScale;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(4) uniform mediump sampler2D _EmissionMap;
in mediump vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat8;
int u_xlati8;
uvec2 u_xlatu8;
mediump float u_xlat16_9;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(0.0588000007,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.529399991,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.176499993,0.0,0.0,0.0);
ImmCB_0[3] = vec4(0.647099972,0.0,0.0,0.0);
ImmCB_0[4] = vec4(0.764699996,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.294099987,0.0,0.0,0.0);
ImmCB_0[6] = vec4(0.882399976,0.0,0.0,0.0);
ImmCB_0[7] = vec4(0.411799997,0.0,0.0,0.0);
ImmCB_0[8] = vec4(0.235300004,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.705900013,0.0,0.0,0.0);
ImmCB_0[10] = vec4(0.117600001,0.0,0.0,0.0);
ImmCB_0[11] = vec4(0.588199973,0.0,0.0,0.0);
ImmCB_0[12] = vec4(0.941200018,0.0,0.0,0.0);
ImmCB_0[13] = vec4(0.470600009,0.0,0.0,0.0);
ImmCB_0[14] = vec4(0.823499978,0.0,0.0,0.0);
ImmCB_0[15] = vec4(0.352899998,0.0,0.0,0.0);
    u_xlat0.x = _Time.y * _speedDiffFromUV3;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.x;
    u_xlat4.xy = u_xlat0.xx * _DSChannel.zw;
    u_xlat0.xw = u_xlat0.xx * _GChannel.zw;
    u_xlat0.xw = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xw;
    u_xlat0.xw = u_xlat0.xw + _NoiseTex_ST.zw;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xw).y;
    u_xlat16_1.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DSChannel.xy + u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_9 = u_xlat16_0.x + -0.5;
    u_xlat0.x = u_xlat16_9 * _dissolveScale;
    u_xlat16_4 = texture(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlat8.xy = vec2(u_xlat16_4) * u_xlat16_1.xy + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_NoiseUnEffectDiff<0.5);
#else
    u_xlatb2 = _NoiseUnEffectDiff<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb2)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_DiffuseTex, u_xlat16_1.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    u_xlat0.x = u_xlat0.x * u_xlat16_4 + u_xlat1.w;
    u_xlat4.x = (-_DissolveSoftSize) + _DissolveStep;
    u_xlat8.x = (-u_xlat4.x) + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = _DissolveSoftSize + _DissolveStep;
    u_xlat0.x = u_xlat0.x + 0.00100000005;
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.xy = u_xlat8.xy * _ScreenParams.xy;
    u_xlatu8.xy = uvec2(u_xlat8.xy);
    u_xlati8 = int(int_bitfieldInsert(0,int(u_xlatu8.x),2,2) );
    u_xlati8 = int(int_bitfieldInsert(u_xlati8,int(u_xlatu8.y),0,2) );
    u_xlat16_3 = _Cutoff * ImmCB_0[u_xlati8].x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + (-u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * _EmissionColor.xyz + u_xlat1.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _DiffuseTex_ST;
uniform 	mediump float _WindStrength;
uniform 	mediump float _WindFrequency;
uniform 	mediump float _WindSpeed;
uniform 	mediump float _inverseUv1;
uniform 	float _animationGradientPower;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec2 in_TEXCOORD2;
out mediump vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = in_COLOR0.x * -0.819000006;
    u_xlat3 = (-in_TEXCOORD2.x) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_inverseUv1);
#else
    u_xlatb3 = 0.5<_inverseUv1;
#endif
    u_xlat16_1 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat16_1 = (u_xlatb3) ? u_xlat16_1 : in_TEXCOORD1.y;
    u_xlat3 = log2(u_xlat16_1);
    vs_TEXCOORD0.w = u_xlat16_1;
    u_xlat3 = u_xlat3 * _animationGradientPower;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat3 * _WindFrequency + u_xlat0.x;
    u_xlat16_1 = min(u_xlat3, 1.0);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat0.x = _Time.y * _WindSpeed + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 6.28318024;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat0.x;
    u_xlat16_1 = u_xlat16_1 * _WindStrength;
    u_xlat0.xyz = vec3(u_xlat16_1) * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat2.xy = in_TEXCOORD0.xy * _DiffuseTex_ST.xy + _DiffuseTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy;
    vs_TEXCOORD0.z = in_TEXCOORD1.x;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
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
vec4 ImmCB_0[16];
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform 	float _speedDiffFromUV3;
uniform 	mediump vec4 _EmissionColor;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _GChannel;
uniform 	vec4 _DSChannel;
uniform 	float _dissolveScale;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(4) uniform mediump sampler2D _EmissionMap;
in mediump vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
mediump float u_xlat16_3;
vec2 u_xlat4;
mediump float u_xlat16_4;
vec2 u_xlat8;
int u_xlati8;
uvec2 u_xlatu8;
mediump float u_xlat16_9;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
ImmCB_0[0] = vec4(0.0588000007,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.529399991,0.0,0.0,0.0);
ImmCB_0[2] = vec4(0.176499993,0.0,0.0,0.0);
ImmCB_0[3] = vec4(0.647099972,0.0,0.0,0.0);
ImmCB_0[4] = vec4(0.764699996,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.294099987,0.0,0.0,0.0);
ImmCB_0[6] = vec4(0.882399976,0.0,0.0,0.0);
ImmCB_0[7] = vec4(0.411799997,0.0,0.0,0.0);
ImmCB_0[8] = vec4(0.235300004,0.0,0.0,0.0);
ImmCB_0[9] = vec4(0.705900013,0.0,0.0,0.0);
ImmCB_0[10] = vec4(0.117600001,0.0,0.0,0.0);
ImmCB_0[11] = vec4(0.588199973,0.0,0.0,0.0);
ImmCB_0[12] = vec4(0.941200018,0.0,0.0,0.0);
ImmCB_0[13] = vec4(0.470600009,0.0,0.0,0.0);
ImmCB_0[14] = vec4(0.823499978,0.0,0.0,0.0);
ImmCB_0[15] = vec4(0.352899998,0.0,0.0,0.0);
    u_xlat0.x = _Time.y * _speedDiffFromUV3;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.x;
    u_xlat4.xy = u_xlat0.xx * _DSChannel.zw;
    u_xlat0.xw = u_xlat0.xx * _GChannel.zw;
    u_xlat0.xw = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xw;
    u_xlat0.xw = u_xlat0.xw + _NoiseTex_ST.zw;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xw).y;
    u_xlat16_1.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DSChannel.xy + u_xlat4.xy;
    u_xlat0.xy = u_xlat0.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_9 = u_xlat16_0.x + -0.5;
    u_xlat0.x = u_xlat16_9 * _dissolveScale;
    u_xlat16_4 = texture(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlat8.xy = vec2(u_xlat16_4) * u_xlat16_1.xy + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_NoiseUnEffectDiff<0.5);
#else
    u_xlatb2 = _NoiseUnEffectDiff<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb2)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_DiffuseTex, u_xlat16_1.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    u_xlat0.x = u_xlat0.x * u_xlat16_4 + u_xlat1.w;
    u_xlat4.x = (-_DissolveSoftSize) + _DissolveStep;
    u_xlat8.x = (-u_xlat4.x) + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = _DissolveSoftSize + _DissolveStep;
    u_xlat0.x = u_xlat0.x + 0.00100000005;
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.xy = u_xlat8.xy * _ScreenParams.xy;
    u_xlatu8.xy = uvec2(u_xlat8.xy);
    u_xlati8 = int(int_bitfieldInsert(0,int(u_xlatu8.x),2,2) );
    u_xlati8 = int(int_bitfieldInsert(u_xlati8,int(u_xlatu8.y),0,2) );
    u_xlat16_3 = _Cutoff * ImmCB_0[u_xlati8].x;
    u_xlat0.x = u_xlat4.x * u_xlat0.x + (-u_xlat16_3);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_FIXED_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _DiffuseTex_ST;
uniform 	mediump float _WindStrength;
uniform 	mediump float _WindFrequency;
uniform 	mediump float _WindSpeed;
uniform 	mediump float _inverseUv1;
uniform 	float _animationGradientPower;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec2 in_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = in_COLOR0.x * -0.819000006;
    u_xlat3 = (-in_TEXCOORD2.x) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlatb3 = 0.5<_inverseUv1;
    u_xlat16_1 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat16_1 = (u_xlatb3) ? u_xlat16_1 : in_TEXCOORD1.y;
    u_xlat3 = log2(u_xlat16_1);
    vs_TEXCOORD0.w = u_xlat16_1;
    u_xlat3 = u_xlat3 * _animationGradientPower;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat3 * _WindFrequency + u_xlat0.x;
    u_xlat16_1 = min(u_xlat3, 1.0);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat0.x = _Time.y * _WindSpeed + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 6.28318024;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat0.x;
    u_xlat16_1 = u_xlat16_1 * _WindStrength;
    u_xlat0.xyz = vec3(u_xlat16_1) * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat2.xy = in_TEXCOORD0.xy * _DiffuseTex_ST.xy + _DiffuseTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy;
    vs_TEXCOORD0.z = in_TEXCOORD1.x;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
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
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform 	float _speedDiffFromUV3;
uniform 	mediump vec4 _EmissionColor;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _GChannel;
uniform 	vec4 _DSChannel;
uniform 	float _dissolveScale;
uniform lowp sampler2D _DissolveMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DiffuseTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _EmissionMap;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb2;
vec2 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat6;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = _Time.y * _speedDiffFromUV3;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.x;
    u_xlat3.xy = u_xlat0.xx * _DSChannel.zw;
    u_xlat0.xw = u_xlat0.xx * _GChannel.zw;
    u_xlat0.xw = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xw;
    u_xlat0.xw = u_xlat0.xw + _NoiseTex_ST.zw;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xw).y;
    u_xlat16_1.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DSChannel.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_7 = u_xlat10_0.x + -0.5;
    u_xlat0.x = u_xlat16_7 * _dissolveScale;
    u_xlat10_3 = texture2D(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlat6.xy = vec2(u_xlat10_3) * u_xlat16_1.xy + vs_TEXCOORD0.xy;
    u_xlatb2 = _NoiseUnEffectDiff<0.5;
    u_xlat16_1.xy = (bool(u_xlatb2)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_DiffuseTex, u_xlat16_1.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat0.x = u_xlat0.x * u_xlat10_3 + u_xlat1.w;
    u_xlat3.x = (-_DissolveSoftSize) + _DissolveStep;
    u_xlat6.x = (-u_xlat3.x) + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = _DissolveSoftSize + _DissolveStep;
    u_xlat0.x = u_xlat0.x + 0.00100000005;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x + (-_Cutoff);
    u_xlat0.x = u_xlat0.x + 0.170000002;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10_0.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_FIXED_ALPHA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _DiffuseTex_ST;
uniform 	mediump float _WindStrength;
uniform 	mediump float _WindFrequency;
uniform 	mediump float _WindSpeed;
uniform 	mediump float _inverseUv1;
uniform 	float _animationGradientPower;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec2 in_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = in_COLOR0.x * -0.819000006;
    u_xlat3 = (-in_TEXCOORD2.x) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlatb3 = 0.5<_inverseUv1;
    u_xlat16_1 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat16_1 = (u_xlatb3) ? u_xlat16_1 : in_TEXCOORD1.y;
    u_xlat3 = log2(u_xlat16_1);
    vs_TEXCOORD0.w = u_xlat16_1;
    u_xlat3 = u_xlat3 * _animationGradientPower;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat3 * _WindFrequency + u_xlat0.x;
    u_xlat16_1 = min(u_xlat3, 1.0);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat0.x = _Time.y * _WindSpeed + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 6.28318024;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat0.x;
    u_xlat16_1 = u_xlat16_1 * _WindStrength;
    u_xlat0.xyz = vec3(u_xlat16_1) * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat2.xy = in_TEXCOORD0.xy * _DiffuseTex_ST.xy + _DiffuseTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy;
    vs_TEXCOORD0.z = in_TEXCOORD1.x;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
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
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform 	float _speedDiffFromUV3;
uniform 	mediump vec4 _EmissionColor;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _GChannel;
uniform 	vec4 _DSChannel;
uniform 	float _dissolveScale;
uniform lowp sampler2D _DissolveMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DiffuseTex;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _EmissionMap;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb2;
vec2 u_xlat3;
lowp float u_xlat10_3;
vec2 u_xlat6;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = _Time.y * _speedDiffFromUV3;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.x;
    u_xlat3.xy = u_xlat0.xx * _DSChannel.zw;
    u_xlat0.xw = u_xlat0.xx * _GChannel.zw;
    u_xlat0.xw = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xw;
    u_xlat0.xw = u_xlat0.xw + _NoiseTex_ST.zw;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xw).y;
    u_xlat16_1.xy = u_xlat10_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DSChannel.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0.x = texture2D(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_7 = u_xlat10_0.x + -0.5;
    u_xlat0.x = u_xlat16_7 * _dissolveScale;
    u_xlat10_3 = texture2D(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlat6.xy = vec2(u_xlat10_3) * u_xlat16_1.xy + vs_TEXCOORD0.xy;
    u_xlatb2 = _NoiseUnEffectDiff<0.5;
    u_xlat16_1.xy = (bool(u_xlatb2)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_DiffuseTex, u_xlat16_1.xy);
    u_xlat1 = u_xlat10_1 * _Color;
    u_xlat0.x = u_xlat0.x * u_xlat10_3 + u_xlat1.w;
    u_xlat3.x = (-_DissolveSoftSize) + _DissolveStep;
    u_xlat6.x = (-u_xlat3.x) + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = _DissolveSoftSize + _DissolveStep;
    u_xlat0.x = u_xlat0.x + 0.00100000005;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x + (-_Cutoff);
    u_xlat0.x = u_xlat0.x + 0.170000002;
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat10_0.xyz = texture2D(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_FIXED_ALPHA" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _DiffuseTex_ST;
uniform 	mediump float _WindStrength;
uniform 	mediump float _WindFrequency;
uniform 	mediump float _WindSpeed;
uniform 	mediump float _inverseUv1;
uniform 	float _animationGradientPower;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec2 in_TEXCOORD2;
out mediump vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = in_COLOR0.x * -0.819000006;
    u_xlat3 = (-in_TEXCOORD2.x) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_inverseUv1);
#else
    u_xlatb3 = 0.5<_inverseUv1;
#endif
    u_xlat16_1 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat16_1 = (u_xlatb3) ? u_xlat16_1 : in_TEXCOORD1.y;
    u_xlat3 = log2(u_xlat16_1);
    vs_TEXCOORD0.w = u_xlat16_1;
    u_xlat3 = u_xlat3 * _animationGradientPower;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat3 * _WindFrequency + u_xlat0.x;
    u_xlat16_1 = min(u_xlat3, 1.0);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat0.x = _Time.y * _WindSpeed + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 6.28318024;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat0.x;
    u_xlat16_1 = u_xlat16_1 * _WindStrength;
    u_xlat0.xyz = vec3(u_xlat16_1) * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat2.xy = in_TEXCOORD0.xy * _DiffuseTex_ST.xy + _DiffuseTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy;
    vs_TEXCOORD0.z = in_TEXCOORD1.x;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
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
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform 	float _speedDiffFromUV3;
uniform 	mediump vec4 _EmissionColor;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _GChannel;
uniform 	vec4 _DSChannel;
uniform 	float _dissolveScale;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(4) uniform mediump sampler2D _EmissionMap;
in mediump vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
vec2 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat6;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = _Time.y * _speedDiffFromUV3;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.x;
    u_xlat3.xy = u_xlat0.xx * _DSChannel.zw;
    u_xlat0.xw = u_xlat0.xx * _GChannel.zw;
    u_xlat0.xw = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xw;
    u_xlat0.xw = u_xlat0.xw + _NoiseTex_ST.zw;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xw).y;
    u_xlat16_1.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DSChannel.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_7 = u_xlat16_0.x + -0.5;
    u_xlat0.x = u_xlat16_7 * _dissolveScale;
    u_xlat16_3 = texture(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlat6.xy = vec2(u_xlat16_3) * u_xlat16_1.xy + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_NoiseUnEffectDiff<0.5);
#else
    u_xlatb2 = _NoiseUnEffectDiff<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb2)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_DiffuseTex, u_xlat16_1.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    u_xlat0.x = u_xlat0.x * u_xlat16_3 + u_xlat1.w;
    u_xlat3.x = (-_DissolveSoftSize) + _DissolveStep;
    u_xlat6.x = (-u_xlat3.x) + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = _DissolveSoftSize + _DissolveStep;
    u_xlat0.x = u_xlat0.x + 0.00100000005;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x + (-_Cutoff);
    u_xlat0.x = u_xlat0.x + 0.170000002;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_FIXED_ALPHA" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _DiffuseTex_ST;
uniform 	mediump float _WindStrength;
uniform 	mediump float _WindFrequency;
uniform 	mediump float _WindSpeed;
uniform 	mediump float _inverseUv1;
uniform 	float _animationGradientPower;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec2 in_TEXCOORD2;
out mediump vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.x = in_COLOR0.x * -0.819000006;
    u_xlat3 = (-in_TEXCOORD2.x) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.5<_inverseUv1);
#else
    u_xlatb3 = 0.5<_inverseUv1;
#endif
    u_xlat16_1 = (-in_TEXCOORD1.y) + 1.0;
    u_xlat16_1 = (u_xlatb3) ? u_xlat16_1 : in_TEXCOORD1.y;
    u_xlat3 = log2(u_xlat16_1);
    vs_TEXCOORD0.w = u_xlat16_1;
    u_xlat3 = u_xlat3 * _animationGradientPower;
    u_xlat3 = exp2(u_xlat3);
    u_xlat0.x = u_xlat3 * _WindFrequency + u_xlat0.x;
    u_xlat16_1 = min(u_xlat3, 1.0);
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat0.x = _Time.y * _WindSpeed + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 6.28318024;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * u_xlat0.x;
    u_xlat16_1 = u_xlat16_1 * _WindStrength;
    u_xlat0.xyz = vec3(u_xlat16_1) * in_NORMAL0.xyz + in_POSITION0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    u_xlat2.xy = in_TEXCOORD0.xy * _DiffuseTex_ST.xy + _DiffuseTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy;
    vs_TEXCOORD0.z = in_TEXCOORD1.x;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat2.zz + u_xlat2.xw;
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
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
uniform 	float _speedDiffFromUV3;
uniform 	mediump vec4 _EmissionColor;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	float _NoiseUnEffectDiff;
uniform 	mediump float _NoiseXStreng;
uniform 	mediump float _NoiseYStreng;
uniform 	vec4 _GChannel;
uniform 	vec4 _DSChannel;
uniform 	float _dissolveScale;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveMask;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DiffuseTex;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(4) uniform mediump sampler2D _EmissionMap;
in mediump vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb2;
vec2 u_xlat3;
mediump float u_xlat16_3;
vec2 u_xlat6;
mediump float u_xlat16_7;
void main()
{
    u_xlat0.x = _Time.y * _speedDiffFromUV3;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD1.x;
    u_xlat3.xy = u_xlat0.xx * _DSChannel.zw;
    u_xlat0.xw = u_xlat0.xx * _GChannel.zw;
    u_xlat0.xw = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xw;
    u_xlat0.xw = u_xlat0.xw + _NoiseTex_ST.zw;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xw).y;
    u_xlat16_1.xy = u_xlat16_0.xx * vec2(_NoiseXStreng, _NoiseYStreng);
    u_xlat0.xy = vs_TEXCOORD0.xy * _DSChannel.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat0.xy + _DissolveTex_ST.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xy).x;
    u_xlat16_7 = u_xlat16_0.x + -0.5;
    u_xlat0.x = u_xlat16_7 * _dissolveScale;
    u_xlat16_3 = texture(_DissolveMask, vs_TEXCOORD0.xy).x;
    u_xlat6.xy = vec2(u_xlat16_3) * u_xlat16_1.xy + vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_NoiseUnEffectDiff<0.5);
#else
    u_xlatb2 = _NoiseUnEffectDiff<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb2)) ? u_xlat6.xy : vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_DiffuseTex, u_xlat16_1.xy);
    u_xlat1 = u_xlat16_1 * _Color;
    u_xlat0.x = u_xlat0.x * u_xlat16_3 + u_xlat1.w;
    u_xlat3.x = (-_DissolveSoftSize) + _DissolveStep;
    u_xlat6.x = (-u_xlat3.x) + u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat0.x = _DissolveSoftSize + _DissolveStep;
    u_xlat0.x = u_xlat0.x + 0.00100000005;
    u_xlat0.x = (-u_xlat3.x) + u_xlat0.x;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x + (-_Cutoff);
    u_xlat0.x = u_xlat0.x + 0.170000002;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.xyz = texture(_EmissionMap, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * _EmissionColor.xyz + u_xlat1.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_FIXED_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_FIXED_ALPHA" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_FIXED_ALPHA" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_FIXED_ALPHA" }
""
}
}
}
}
}