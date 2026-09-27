//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Effect/MultiFireEye" {
Properties {

_BaseMap ("噪声图 r:虹膜火焰 g:虹膜边缘形状 b:眼白火焰", 2D) = "white" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_NoiseTilings ("xy:中心UV zw:外层UV", Vector) = (1.08,2,0.5,1.98)

_NoiseScrollSpeed ("火焰流速控制", Vector) = (-0.5,0.1,-0.3,0.1)

_FlameColor0 ("中心火焰颜色", Color) = (1,0.5,0.1,1)

_FlameColor1 ("外层火焰颜色", Color) = (1,0.5,0.3,1)

_IrisShapeMap ("瞳孔形状图（r:瞳孔形状 a：虹膜范围，同时排列四个瞳孔）", 2D) = "white" { }

_IrisColor ("瞳孔颜色", Color) = (0,0,0,1)

_IrisTransformAnimSpeed ("眼球转动速度（左上，右上，左下，右下）", Vector) = (1,2,1.5,0.5)

_IrisScaleAnimSpeed ("眼球缩放速度（左上，右上，左下，右下）", Vector) = (1,2,1.5,0.5)

_IrisAnimRadius ("眼球转动半径（xy:左上，zw:右上）", Vector) = (0.2,0.2,0.35,0.35)

_IrisAnimRadius2 ("眼球转动半径（xy:左下，zw:右下）", Vector) = (0.25,0.25,0.1,0.1)

_BorderTilings ("xy:虹膜边缘Tilings zw:虹膜边缘Speeds", Vector) = (0.7,1.4,-0.5,0)

_BorderParams ("x:火焰阈值 y:火焰范围 z:火焰过渡", Vector) = (0,0,0,0)

_SpecColor ("高光颜色", Color) = (1,1,1,1)

_Gloss ("高光强度", Range(8, 128)) = 32.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 17081
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18.x = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = u_xlat16_18.xxx * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18.x = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18.x;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = _SpecColor.zxy * u_xlat16_1.xxx + u_xlat16_0.zxy;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat6.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat6.xz * vec2(15.0, 0.9375);
    u_xlat42 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat6.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat6.x = u_xlat6.x * 15.0 + (-u_xlat42);
    u_xlat0.x = u_xlat42 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat11.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat11.xy, 0.0).xyz;
    u_xlat11.xyz = (-u_xlat16_18.xyz) + u_xlat16_11.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat11.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat6.xyz;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18.x = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = u_xlat16_18.xxx * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18.x = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18.x;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = _SpecColor.zxy * u_xlat16_1.xxx + u_xlat16_0.zxy;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat6.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat6.xz * vec2(15.0, 0.9375);
    u_xlat42 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat6.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat6.x = u_xlat6.x * 15.0 + (-u_xlat42);
    u_xlat0.x = u_xlat42 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat11.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat11.xy, 0.0).xyz;
    u_xlat11.xyz = (-u_xlat16_18.xyz) + u_xlat16_11.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat11.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _IrisShapeMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat10_30.xy = texture2D(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat10_6 = texture2D(_BaseMap, u_xlat16_0.xy).x;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat10_30.x) + u_xlat10_30.y;
    u_xlat16_26.x = u_xlat10_6 * u_xlat16_26.x;
    u_xlat18.xz = _Time.yy * _BorderTilings.zw;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat10_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat10_30.x;
    u_xlat16_3.xyz = vec3(u_xlat10_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat10_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat10_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat10_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat10_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _IrisShapeMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat10_30.xy = texture2D(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat10_6 = texture2D(_BaseMap, u_xlat16_0.xy).x;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat10_30.x) + u_xlat10_30.y;
    u_xlat16_26.x = u_xlat10_6 * u_xlat16_26.x;
    u_xlat18.xz = _Time.yy * _BorderTilings.zw;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat10_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat10_30.x;
    u_xlat16_3.xyz = vec3(u_xlat10_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat10_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat10_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat10_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat10_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18.x = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = u_xlat16_18.xxx * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18.x = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18.x;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = _SpecColor.zxy * u_xlat16_1.xxx + u_xlat16_0.zxy;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat6.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat6.xz * vec2(15.0, 0.9375);
    u_xlat42 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat6.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat6.x = u_xlat6.x * 15.0 + (-u_xlat42);
    u_xlat0.x = u_xlat42 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat11.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat11.xy, 0.0).xyz;
    u_xlat11.xyz = (-u_xlat16_18.xyz) + u_xlat16_11.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat11.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat6.xyz;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18.x = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = u_xlat16_18.xxx * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18.x = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18.x;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.xyz = _SpecColor.zxy * u_xlat16_1.xxx + u_xlat16_0.zxy;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat6.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat6.xz * vec2(15.0, 0.9375);
    u_xlat42 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat6.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat6.x = u_xlat6.x * 15.0 + (-u_xlat42);
    u_xlat0.x = u_xlat42 * 0.0625 + u_xlat0.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat11.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_11.xyz = textureLod(_ACESLutTex, u_xlat11.xy, 0.0).xyz;
    u_xlat11.xyz = (-u_xlat16_18.xyz) + u_xlat16_11.xyz;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat11.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _IrisShapeMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat10_30.xy = texture2D(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat10_6 = texture2D(_BaseMap, u_xlat16_0.xy).x;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat10_30.x) + u_xlat10_30.y;
    u_xlat16_26.x = u_xlat10_6 * u_xlat16_26.x;
    u_xlat18.xz = _Time.yy * _BorderTilings.zw;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat10_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat10_30.x;
    u_xlat16_3.xyz = vec3(u_xlat10_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat10_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat10_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat10_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat10_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _IrisShapeMap;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
lowp vec2 u_xlat10_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat10_0 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat10_30.xy = texture2D(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat10_6 = texture2D(_BaseMap, u_xlat16_0.xy).x;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat10_30.x) + u_xlat10_30.y;
    u_xlat16_26.x = u_xlat10_6 * u_xlat16_26.x;
    u_xlat18.xz = _Time.yy * _BorderTilings.zw;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat10_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat10_30.x;
    u_xlat16_3.xyz = vec3(u_xlat10_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat10_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat10_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat10_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat10_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18 = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18 = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18 = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18 = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18 = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18 = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
in highp vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0.xyxy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = max(u_xlat6, 1.17549435e-38);
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	mediump vec4 _NoiseTilings;
uniform 	mediump vec4 _NoiseScrollSpeed;
uniform 	mediump vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	mediump vec4 _IrisColor;
uniform 	mediump vec4 _IrisTransformAnimSpeed;
uniform 	mediump vec4 _IrisScaleAnimSpeed;
uniform 	mediump vec4 _IrisAnimRadius;
uniform 	mediump vec4 _IrisAnimRadius2;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _IrisShapeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec4 u_xlat5;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_10;
bool u_xlatb11;
float u_xlat12;
mediump vec3 u_xlat16_13;
mediump float u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump vec2 u_xlat16_20;
mediump vec2 u_xlat16_25;
mediump vec2 u_xlat16_26;
vec2 u_xlat30;
mediump vec2 u_xlat16_30;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump float u_xlat16_39;
float u_xlat42;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat12 = sin(u_xlat0.y);
    u_xlat12 = u_xlat12 * 0.5 + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.437585443;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_0.x = texture(_BaseMap, u_xlat0.xx).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_2 = u_xlat16_1.xxxx * _IrisAnimRadius;
    u_xlat16_1 = u_xlat16_1.xxxx * _IrisAnimRadius2;
    u_xlat16_3 = vec4(u_xlat12) * _IrisTransformAnimSpeed;
    u_xlat16_4.x = u_xlat12 * u_xlat12;
    u_xlat16_0 = u_xlat16_4.xxxx * _IrisScaleAnimSpeed;
    u_xlat16_0 = sin(u_xlat16_0);
    u_xlat16_0 = max(u_xlat16_0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat16_0 = u_xlat16_0 * vec4(0.0500000007, 0.0500000007, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16_4.x = sin(u_xlat16_3.y);
    u_xlat16_5 = cos(u_xlat16_3.y);
    u_xlat16_4.y = u_xlat16_5;
    u_xlat16_26.xy = u_xlat16_2.zw * u_xlat16_4.xy;
    u_xlat4 = vs_TEXCOORD0.xyxy + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5 = u_xlat4.zwzw * u_xlat16_0.xxyy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat0 = u_xlat4 * u_xlat16_0.zzww + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat6.xy = u_xlat16_26.xy * vec2(0.100000001, 0.100000001) + u_xlat5.zw;
    u_xlat16_26.xy = max(u_xlat6.xy, vec2(0.5, 0.5));
    u_xlat16_26.xy = min(u_xlat16_26.xy, vec2(1.0, 1.0));
    u_xlat16_7.xy = u_xlat16_26.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_8.x = sin(u_xlat16_3.w);
    u_xlat16_9.x = cos(u_xlat16_3.w);
    u_xlat16_20.x = u_xlat16_8.x;
    u_xlat16_20.y = u_xlat16_9.x;
    u_xlat16_25.xy = u_xlat16_1.zw * u_xlat16_20.xy;
    u_xlat6.xy = u_xlat16_25.xy * vec2(0.100000001, 0.100000001) + u_xlat0.zw;
    u_xlat16_25.xy = max(u_xlat6.xy, vec2(0.5, 0.0));
    u_xlat16_25.xy = min(u_xlat16_25.xy, vec2(1.0, 0.5));
    u_xlat16_8.x = u_xlat16_25.x * 2.0 + -1.0;
    u_xlat6.xy = vs_TEXCOORD0.yx + vs_TEXCOORD0.yx;
    u_xlat6.xy = floor(u_xlat6.xy);
    u_xlat16_9.xy = (-u_xlat6.xy) + vec2(1.0, 1.0);
    u_xlat16_8.yz = u_xlat16_25.xy * u_xlat16_9.xx;
    u_xlat16_9.z = 2.0;
    u_xlat16_25.xy = u_xlat16_8.xz * u_xlat16_9.xz;
    u_xlat16_26.xy = u_xlat6.xx * u_xlat16_26.xy + u_xlat16_8.yz;
    u_xlat16_25.xy = u_xlat6.xx * u_xlat16_7.xy + u_xlat16_25.xy;
    u_xlat16_7.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = sin(u_xlat16_3.x);
    u_xlat16_8.x = sin(u_xlat16_3.z);
    u_xlat16_10 = cos(u_xlat16_3.z);
    u_xlat16_3.y = u_xlat16_7.x;
    u_xlat16_2.xy = u_xlat16_2.xy * u_xlat16_3.xy;
    u_xlat30.xy = u_xlat16_2.xy * vec2(0.100000001, 0.100000001) + u_xlat5.xy;
    u_xlat16_2.xy = max(u_xlat30.xy, vec2(0.0, 0.5));
    u_xlat16_2.xy = min(u_xlat16_2.xy, vec2(0.5, 1.0));
    u_xlat16_3.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_3.z = u_xlat16_2.y * 2.0 + -1.0;
    u_xlat16_8.y = u_xlat16_10;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_8.xy;
    u_xlat30.xy = u_xlat16_1.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat16_1.xy = max(u_xlat30.xy, vec2(0.0, 0.0));
    u_xlat16_1.xy = min(u_xlat16_1.xy, vec2(0.5, 0.5));
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.xx;
    u_xlat16_15.xz = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_2.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_26.xy + u_xlat16_1.xy;
    u_xlat16_30.xy = texture(_IrisShapeMap, u_xlat16_1.xy).xw;
    u_xlat16_1.xy = u_xlat6.xx * u_xlat16_3.xz + u_xlat16_15.xz;
    u_xlat16_1.xy = u_xlat16_1.xy * u_xlat16_9.yy;
    u_xlat16_1.xy = u_xlat6.yy * u_xlat16_25.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(-0.5, -0.5);
    u_xlat16_25.x = max(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = float(1.0) / u_xlat16_25.x;
    u_xlat16_37 = min(abs(u_xlat16_1.y), abs(u_xlat16_1.x));
    u_xlat16_25.x = u_xlat16_25.x * u_xlat16_37;
    u_xlat16_37 = u_xlat16_25.x * u_xlat16_25.x;
    u_xlat6.x = u_xlat16_37 * 0.0208350997 + -0.0851330012;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.180141002;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + -0.330299497;
    u_xlat6.x = u_xlat16_37 * u_xlat6.x + 0.999866009;
    u_xlat18.x = u_xlat16_25.x * u_xlat6.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(abs(u_xlat16_1.y)<abs(u_xlat16_1.x));
#else
    u_xlatb11 = abs(u_xlat16_1.y)<abs(u_xlat16_1.x);
#endif
    u_xlat18.x = u_xlatb11 ? u_xlat18.x : float(0.0);
    u_xlat6.x = u_xlat16_25.x * u_xlat6.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_1.y<(-u_xlat16_1.y));
#else
    u_xlatb18 = u_xlat16_1.y<(-u_xlat16_1.y);
#endif
    u_xlat18.x = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat18.x + u_xlat6.x;
    u_xlat16_25.x = min(u_xlat16_1.y, u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat16_25.x<(-u_xlat16_25.x));
#else
    u_xlatb18 = u_xlat16_25.x<(-u_xlat16_25.x);
#endif
    u_xlat16_25.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_25.x>=(-u_xlat16_25.x));
#else
    u_xlatb11 = u_xlat16_25.x>=(-u_xlat16_25.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb11;
    u_xlat6.x = (u_xlatb18) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat16_2.y = u_xlat6.x * 0.159154937;
    u_xlat16_2.x = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_0 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat16_0 = u_xlat16_2.xyxy * _NoiseTilings + u_xlat16_0;
    u_xlat16_6 = texture(_BaseMap, u_xlat16_0.xy).x;
    u_xlat16_18 = texture(_BaseMap, u_xlat16_0.zw).z;
    u_xlat16_13.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_26.x = (-u_xlat16_30.x) + u_xlat16_30.y;
    u_xlat16_26.x = u_xlat16_6 * u_xlat16_26.x;
    u_xlat18.xz = _BorderTilings.zw * _Time.yy;
    u_xlat18.xz = u_xlat16_2.xy * _BorderTilings.xy + u_xlat18.xz;
    u_xlat16_18 = texture(_BaseMap, u_xlat18.xz).y;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + u_xlat16_18;
    u_xlat16_1.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_2.x = float(1.0) / (-_BorderParams.z);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_14 = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_38 = u_xlat16_14 * u_xlat16_26.x;
    u_xlat16_26.x = u_xlat16_26.x * u_xlat16_14 + u_xlat16_30.x;
    u_xlat16_3.xyz = vec3(u_xlat16_6) * _FlameColor0.xyz;
    u_xlat16_39 = (-u_xlat16_30.x) + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_3.xyz;
    u_xlat16_39 = u_xlat16_39 * u_xlat16_6;
    u_xlat16_3.xyz = vec3(u_xlat16_38) * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat16_39) * u_xlat16_30.xxx + u_xlat16_3.xyz;
    u_xlat16_38 = (-u_xlat16_26.x) + 1.0;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_38);
    u_xlat16_13.xyz = vec3(u_xlat16_14) * u_xlat16_13.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_26.xxx + u_xlat16_13.xyz;
    u_xlat16_0.w = u_xlat16_2.x * u_xlat16_1.x + u_xlat16_26.x;
    u_xlat16_1 = (-u_xlat16_0) + _IrisColor;
    u_xlat16_0 = u_xlat16_30.xxxx * u_xlat16_1 + u_xlat16_0;
    u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat42 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat6.xyz = vec3(u_xlat42) * u_xlat6.xyz;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_1.xxx + u_xlat6.xyz;
    u_xlat16_37 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_1.xyz = vec3(u_xlat16_37) * u_xlat16_1.xyz;
    u_xlat16_37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_37 = inversesqrt(u_xlat16_37);
    u_xlat16_2.xyz = vec3(u_xlat16_37) * vs_TEXCOORD1.xyz;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _Gloss;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    SV_Target0.xyz = _SpecColor.xyz * u_xlat16_1.xxx + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 94448
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
CustomEditor "CodeGenShaderGUI.Theseus_MultiFireEyeGUI"
}