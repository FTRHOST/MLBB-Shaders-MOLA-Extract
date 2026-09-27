//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/BlackWhiteComicFlash" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_MainTex ("Texture", 2D) = "white" { }

_NoiseStyleTex ("NoiseStyleTex分辨率256", 2D) = "white" { }

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 43044
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
out highp vec4 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb0){
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
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat14<(-u_xlat14));
#else
    u_xlatb6 = u_xlat14<(-u_xlat14);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat16_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    SV_Target0.w = 1.0;
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
out highp vec4 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb0){
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
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat14<(-u_xlat14));
#else
    u_xlatb6 = u_xlat14<(-u_xlat14);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat16_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
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
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb0){
        u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
        u_xlat0.xyz = exp2(u_xlat0.xyz);
        u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
        u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
        SV_Target0.xyz = u_xlat0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb6 = u_xlat14<(-u_xlat14);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat10_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb0){
        u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
        u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
        u_xlat0.xyz = exp2(u_xlat0.xyz);
        u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
        u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
        SV_Target0.xyz = u_xlat0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb6 = u_xlat14<(-u_xlat14);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat10_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
out highp vec4 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb0){
        SV_Target0.xyz = u_xlat16_1.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat14<(-u_xlat14));
#else
    u_xlatb6 = u_xlat14<(-u_xlat14);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat16_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
out highp vec4 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb0){
        SV_Target0.xyz = u_xlat16_1.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat14<(-u_xlat14));
#else
    u_xlatb6 = u_xlat14<(-u_xlat14);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat16_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat16_0.x = texture(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19 = min(max(u_xlat16_19, 0.0), 1.0);
#else
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb0){
        SV_Target0.xyz = u_xlat16_1.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb6 = u_xlat14<(-u_xlat14);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat10_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _CenterAndSpeed;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _UseFlash;
uniform 	mediump float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
bool u_xlatb6;
mediump float u_xlat16_10;
vec2 u_xlat12;
float u_xlat14;
bool u_xlatb14;
mediump float u_xlat16_16;
float u_xlat18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat16_22;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb0){
        SV_Target0.xyz = u_xlat16_1.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_19 = _RadialScale + _RadialScale;
    u_xlat0.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat12.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat12.x = sqrt(u_xlat12.x);
    u_xlat2.x = u_xlat16_19 * u_xlat12.x;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat18 = u_xlat18 * u_xlat14;
    u_xlat14 = u_xlat18 * u_xlat18;
    u_xlat20 = u_xlat14 * 0.0208350997 + -0.0851330012;
    u_xlat20 = u_xlat14 * u_xlat20 + 0.180141002;
    u_xlat20 = u_xlat14 * u_xlat20 + -0.330299497;
    u_xlat14 = u_xlat14 * u_xlat20 + 0.999866009;
    u_xlat20 = u_xlat18 * u_xlat14;
    u_xlatb3 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat20 = u_xlat20 * -2.0 + 1.57079637;
    u_xlat20 = u_xlatb3 ? u_xlat20 : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat14 + u_xlat20;
    u_xlatb14 = u_xlat0.y<(-u_xlat0.y);
    u_xlat14 = u_xlatb14 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat18 + u_xlat14;
    u_xlat14 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb6 = u_xlat14<(-u_xlat14);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb0 = u_xlatb0 && u_xlatb6;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat18) : u_xlat18;
    u_xlat0.x = u_xlat0.x * _LengthScale;
    u_xlat2.y = u_xlat0.x * 0.159154579;
    u_xlat0.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat2.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).x;
    u_xlat16_19 = log2(u_xlat12.x);
    u_xlat16_19 = u_xlat16_19 * _ExplodeRange;
    u_xlat16_19 = exp2(u_xlat16_19);
    u_xlat16_19 = u_xlat16_19 + -1.0;
    u_xlat16_19 = _ExplodeProgress * u_xlat16_19 + 1.0;
    u_xlat16_19 = u_xlat10_0.x * u_xlat16_19;
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat10_0.x = texture2D(_NoiseStyleTex, u_xlat0.xy).y;
    u_xlat16_4.x = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x + 0.0125228781;
    u_xlat16_4.x = u_xlat10_0.x * u_xlat16_4.x;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + u_xlat16_10;
    u_xlat16_19 = u_xlat16_19 + (-_BlackWhiteThreshold);
    u_xlat16_10 = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_10;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_10 = u_xlat16_19 * -2.0 + 3.0;
    u_xlat16_19 = u_xlat16_19 * u_xlat16_19;
    u_xlat16_16 = u_xlat16_19 * u_xlat16_10;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_4.x = u_xlat16_4.x * _StyleStr;
    u_xlat16_22 = u_xlat16_10 * u_xlat16_19 + u_xlat16_4.x;
    u_xlat16_19 = u_xlat16_10 * u_xlat16_19 + (-u_xlat16_4.x);
    u_xlat16_19 = (-u_xlat16_22) + u_xlat16_19;
    u_xlat16_19 = u_xlat16_16 * u_xlat16_19 + u_xlat16_22;
    u_xlat16_19 = (u_xlatb0) ? u_xlat16_19 : u_xlat16_16;
    u_xlat16_19 = clamp(u_xlat16_19, 0.0, 1.0);
    u_xlat16_4.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_4.xyz = _FirstColor.www * u_xlat16_4.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = _SecondColor.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_4.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
    SV_Target0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
}
}
}
}