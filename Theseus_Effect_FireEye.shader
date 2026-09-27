//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Effect/FireEye" {
Properties {

[Header(Base)] _BaseMap ("BaseMap", 2D) = "white" { }

_BaseMap1 ("BaseMap1", 2D) = "white" { }

[Header(FlameControl)] _NoiseTilings ("NoiseTilings", Vector) = (1.08,2,0.5,1.98)

_NoiseScrollSpeed ("NoiseScrollSpeed", Vector) = (-0.5,0.1,-0.3,0.1)

_FlameColor0 ("FlameColor0", Color) = (1,0.5,0.1,1)

_FlameColor1 ("FlameColor1", Color) = (1,0.5,0.3,1)

[Header(IrisControl)] _IrisShapeMap ("IrisShapeMap", 2D) = "white" { }

_IrisColor ("IrisColor", Color) = (0,0,0,1)

_IrisShapeTransformParams ("IrisShapeTransformParams", Vector) = (1,1,0,0)

_IrisTransformAnimSpeed ("IrisTransformAnimSpeed", Range(0, 6)) = 2.0

_IrisScaleAnimSpeed ("_IrisScaleAnimSpeed", Range(0, 50)) = 2.0

_IrisAnimRadius ("IrisAnimRadius", Range(0, 2)) = 0.3499999940395355

_PupilOffset ("PupilOffset", Vector) = (0,0,0,0)

[Header(Border)] _BorderTilings ("BorderTilings", Vector) = (0.7,1.4,1,1.8)

_BorderSpeeds ("BorderSpeeds", Vector) = (-0.5,0,-0.7,0)

_BorderParams ("BorderParams", Vector) = (0,0,0,0)

_SpecColor ("Specular Color", Color) = (1,1,1,1)

_Gloss ("Gloss", Range(8, 128)) = 32.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 26821
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
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(2) uniform mediump sampler2D _BaseMap1;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = texture(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _BorderSpeeds.xy * _Time.yy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat16_18 = texture(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat16_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat16_12 = texture(_BaseMap, u_xlat1.xy).x;
    u_xlat16_18 = texture(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat16_0.x) + u_xlat16_0.y;
    u_xlat16_21 = u_xlat16_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat16_0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat16_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb18 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
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
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(2) uniform mediump sampler2D _BaseMap1;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = texture(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _BorderSpeeds.xy * _Time.yy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat16_18 = texture(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat16_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat16_12 = texture(_BaseMap, u_xlat1.xy).x;
    u_xlat16_18 = texture(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat16_0.x) + u_xlat16_0.y;
    u_xlat16_21 = u_xlat16_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat16_0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat16_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb18 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
uniform lowp sampler2D _IrisShapeMap;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _BaseMap1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xy = texture2D(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _Time.yy * _BorderSpeeds.xy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat10_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat10_12 = texture2D(_BaseMap, u_xlat1.xy).x;
    u_xlat10_18 = texture2D(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat10_0.x) + u_xlat10_0.y;
    u_xlat16_21 = u_xlat10_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat10_0.x;
    u_xlat16_5.xyz = vec3(u_xlat10_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat10_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat10_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat10_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlatb18 = 0.0>=_COLOR_MODE;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
uniform lowp sampler2D _IrisShapeMap;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _BaseMap1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xy = texture2D(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _Time.yy * _BorderSpeeds.xy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat10_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat10_12 = texture2D(_BaseMap, u_xlat1.xy).x;
    u_xlat10_18 = texture2D(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat10_0.x) + u_xlat10_0.y;
    u_xlat16_21 = u_xlat10_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat10_0.x;
    u_xlat16_5.xyz = vec3(u_xlat10_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat10_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat10_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat10_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlatb18 = 0.0>=_COLOR_MODE;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
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
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(2) uniform mediump sampler2D _BaseMap1;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = texture(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _BorderSpeeds.xy * _Time.yy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat16_18 = texture(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat16_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat16_12 = texture(_BaseMap, u_xlat1.xy).x;
    u_xlat16_18 = texture(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat16_0.x) + u_xlat16_0.y;
    u_xlat16_21 = u_xlat16_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat16_0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat16_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb18 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
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
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _IrisShapeMap;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(2) uniform mediump sampler2D _BaseMap1;
in highp vec4 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_0.xy = texture(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _BorderSpeeds.xy * _Time.yy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat16_18 = texture(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat16_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _NoiseScrollSpeed * _Time.yyyy;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat16_12 = texture(_BaseMap, u_xlat1.xy).x;
    u_xlat16_18 = texture(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat16_0.x) + u_xlat16_0.y;
    u_xlat16_21 = u_xlat16_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat16_0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat16_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_COLOR_MODE);
#else
    u_xlatb18 = 0.0>=_COLOR_MODE;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
uniform lowp sampler2D _IrisShapeMap;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _BaseMap1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xy = texture2D(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _Time.yy * _BorderSpeeds.xy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat10_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat10_12 = texture2D(_BaseMap, u_xlat1.xy).x;
    u_xlat10_18 = texture2D(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat10_0.x) + u_xlat10_0.y;
    u_xlat16_21 = u_xlat10_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat10_0.x;
    u_xlat16_5.xyz = vec3(u_xlat10_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat10_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat10_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat10_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlatb18 = 0.0>=_COLOR_MODE;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FlameColor0;
uniform 	mediump vec4 _FlameColor1;
uniform 	vec4 _NoiseTilings;
uniform 	vec4 _NoiseScrollSpeed;
uniform 	vec4 _BorderSpeeds;
uniform 	vec4 _BorderTilings;
uniform 	mediump vec4 _BorderParams;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Gloss;
uniform 	float _IrisTransformAnimSpeed;
uniform 	float _IrisScaleAnimSpeed;
uniform 	float _IrisAnimRadius;
uniform 	vec4 _PupilOffset;
uniform lowp sampler2D _IrisShapeMap;
uniform lowp sampler2D _BaseMap;
uniform lowp sampler2D _BaseMap1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec2 u_xlat6;
bool u_xlatb7;
mediump float u_xlat16_9;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
mediump float u_xlat16_15;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xy = _Time.yy * vec2(0.5, 0.300000012);
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6.x = sin(u_xlat0.y);
    u_xlat0.x = u_xlat6.x * 0.5 + u_xlat0.x;
    u_xlat6.x = u_xlat0.x * _IrisTransformAnimSpeed;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * _IrisScaleAnimSpeed;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = u_xlat0.x * 0.100000001 + 1.0;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2.x = cos(u_xlat6.x);
    u_xlat1.y = u_xlat2.x;
    u_xlat6.xy = u_xlat1.xy * vec2(vec2(_IrisAnimRadius, _IrisAnimRadius));
    u_xlat6.xy = u_xlat6.xy * vec2(0.100000001, 0.100000001);
    u_xlat18 = vs_TEXCOORD0.x + -0.5;
    u_xlat1.x = u_xlat18 + (-_PupilOffset.x);
    u_xlat18 = vs_TEXCOORD0.y + _PupilOffset.y;
    u_xlat1.y = u_xlat18 + -0.5;
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + u_xlat6.xy;
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat1.y = u_xlat12 * 0.159154937;
    u_xlat12 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat10_0.xy = texture2D(_IrisShapeMap, u_xlat0.xy).xw;
    u_xlat12 = sqrt(u_xlat12);
    u_xlat1.x = u_xlat12 + u_xlat12;
    u_xlat13.xy = _Time.yy * _BorderSpeeds.xy;
    u_xlat13.xy = u_xlat1.xy * _BorderTilings.xy + u_xlat13.xy;
    u_xlat10_18 = texture2D(_BaseMap, u_xlat13.xy).y;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat10_18;
    u_xlat12 = u_xlat1.x * u_xlat12;
    u_xlat16_3.x = u_xlat12 * _BorderParams.x + (-_BorderParams.y);
    u_xlat16_9 = float(1.0) / (-_BorderParams.z);
    u_xlat16_3.x = u_xlat16_9 * u_xlat16_3.x;
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
    u_xlat16_9 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_15 = u_xlat16_3.x * u_xlat16_9;
    u_xlat2 = _Time.yyyy * _NoiseScrollSpeed;
    u_xlat1 = u_xlat1.xyxy * _NoiseTilings + u_xlat2;
    u_xlat10_12 = texture2D(_BaseMap, u_xlat1.xy).x;
    u_xlat10_18 = texture2D(_BaseMap1, u_xlat1.zw).y;
    u_xlat16_4.xyz = vec3(u_xlat10_18) * _FlameColor1.xyz;
    u_xlat16_21 = (-u_xlat10_0.x) + u_xlat10_0.y;
    u_xlat16_21 = u_xlat10_12 * u_xlat16_21;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_21;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_15 + u_xlat10_0.x;
    u_xlat16_5.xyz = vec3(u_xlat10_12) * _FlameColor0.xyz;
    u_xlat16_23 = (-u_xlat10_0.x) + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat16_23 = u_xlat10_12 * u_xlat16_23;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat10_0.xxx + u_xlat16_5.xyz;
    u_xlat16_22 = (-u_xlat16_21) + 1.0;
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * vec3(u_xlat16_21) + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_9 * u_xlat16_3.x + u_xlat16_21;
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(_MainLightDirectionAndAngleOffset.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_3.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.x = dot(u_xlat16_3.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Gloss;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = _SpecColor.xyz * u_xlat0.xxx + u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz + vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_3.xyz = u_xlat0.xyz / u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlatb18 = 0.0>=_COLOR_MODE;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat16_3.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
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
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 87177
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
CustomEditor "HeroShowRenderingGUI.FireEyeBallShaderGUI"
}