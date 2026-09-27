//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/VertexMove" {
Properties {

_cull ("剔除模式", Float) = 2.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_MainColor ("主图颜色", Color) = (1,1,1,1)

_isCompressed ("_IsCompressed", Float) = 1.0

_MainTex ("MainTex", 2D) = "white" { }

_Cutoff ("裁切阈值", Range(0, 0.9)) = 0.5

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_SHOW_COLOR_R ("SHOW COLOR R", Float) = 0.0

_SHOW_COLOR_G ("SHOW COLOR G", Float) = 0.0

_WindEdgeFlutterVector ("_WindEdgeFlutterVector", Vector) = (0.5,0.5,0.5,0.5)

_WindParams ("风向参数XYZ是风的方向W是风的大小", Vector) = (1,1,1,1)

_EdgeBendingFactor ("混合法线振幅", Float) = 0.0

_Light_PW ("Light_PW", Float) = 1.0

_Light ("Light", 2D) = "white" { }

_Light_C ("Light_C", Color) = (1,1,1,1)

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogVector ("FogVector", Vector) = (9999,1,0,0)

}
SubShader {
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "AlphaTest" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 39827
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_0.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * vec3(_Light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_4.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_0.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * vec3(_Light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_4.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp float vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = (-u_xlat16_2.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.zxy * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp float vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = (-u_xlat16_2.xyz) * u_xlat0.xxx + _FogColor.zxy;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.zxy * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5 = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5 + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.zxy * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5 = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5 + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.zxy * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_5.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_5.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat0.xyz = (-u_xlat16_2.xyz) * _MainColor.zxy + _FogColor.zxy;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.zxy * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_4.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat12;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat0.xyz = (-u_xlat16_2.xyz) * _MainColor.zxy + _FogColor.zxy;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.zxy * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_4.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1<0.0);
#else
    u_xlatb1.x = u_xlat1<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_0.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1<0.0);
#else
    u_xlatb1.x = u_xlat1<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_0.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp float vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = (-u_xlat16_2.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp float vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat6;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5.x = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5.x + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat1.xyz = (-u_xlat16_2.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5 = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5 + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
vec3 u_xlat4;
vec2 u_xlat8;
mediump vec2 u_xlat16_9;
float u_xlat12;
float u_xlat14;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_9.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_9.yy, u_xlat16_1.yy);
    u_xlat4.x = dot(u_xlat16_9.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat4.x * in_COLOR0.x;
    u_xlat8.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat14 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat8.xy * vec2(u_xlat14);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat14) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat14) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat12 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat12) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat14) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	mediump float _shadowStrength;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(1) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat6;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_17;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD1.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb16 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb16)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.xxxx + u_xlat0;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat3;
    u_xlat0 = u_xlat3 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat6 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat0.z = _ShadowBias.y * u_xlat6 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat4.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat4.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_17 = (-_ShadowBias.w) + 1.0;
    u_xlat5 = (-u_xlat16_17) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat5 + u_xlat16_17;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat0.xyz = (-u_xlat16_2.xyz) * _MainColor.xyz + _FogColor.xyz;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
uniform 	mediump vec4 _WindEdgeFlutterVector;
uniform 	vec4 _WindParams;
uniform 	mediump float _EdgeBendingFactor;
uniform 	mediump vec2 _FogVector;
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
in mediump vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD1;
out highp float vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
bvec2 u_xlatb2;
vec3 u_xlat3;
bvec2 u_xlatb3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat10;
mediump vec2 u_xlat16_11;
float u_xlat15;
float u_xlat17;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat16_1.xy = vec2(1.0, 1.0) / _WindEdgeFlutterVector.yw;
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat16_1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat16_1.xy = fract(u_xlat16_1.xy);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_11.xy = abs(u_xlat16_1.xy) * abs(u_xlat16_1.xy);
    u_xlat16_1.xy = -abs(u_xlat16_1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat0.x = dot(u_xlat16_11.yy, u_xlat16_1.yy);
    u_xlat5.x = dot(u_xlat16_11.xx, u_xlat16_1.xx);
    u_xlat2.y = u_xlat0.x * in_COLOR0.y;
    u_xlat3.y = u_xlat5.x * in_COLOR0.x;
    u_xlat10.xy = u_xlat3.yy * _WindEdgeFlutterVector.xy;
    u_xlat17 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat3.xz = u_xlat10.xy * vec2(u_xlat17);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat10.x = u_xlat2.y * _WindEdgeFlutterVector.z;
    u_xlat2.xz = vec2(u_xlat17) * u_xlat10.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat3.xyz;
    u_xlat3.xyz = _WindParams.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_COLOR0.yyy;
    u_xlat0.xyz = vec3(u_xlat17) * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat0.xyz;
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat2.x = u_xlatb2.x ? float(-1.0) : 0.0;
    u_xlat2.y = u_xlatb2.y ? float(-1.0) : 0.0;
;
    u_xlatb3.xy = lessThan(in_NORMAL0.xzxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb3.x) ? float(1.0) : u_xlat2.x;
        hlslcc_movcTemp.y = (u_xlatb3.y) ? float(1.0) : u_xlat2.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat15 = in_COLOR0.x * 0.100000001;
    u_xlat3.xy = vec2(u_xlat15) * in_NORMAL0.xz;
    u_xlat2.xy = u_xlat2.xy * u_xlat3.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_EdgeBendingFactor);
    u_xlat2.xz = vec2(u_xlat17) * u_xlat2.xy;
    u_xlat2.y = 0.0;
    u_xlat2.xyz = u_xlat2.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_4 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD4 = u_xlat0.x / u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4 = min(max(vs_TEXCOORD4, 0.0), 1.0);
#else
    vs_TEXCOORD4 = clamp(vs_TEXCOORD4, 0.0, 1.0);
#endif
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
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _isCompressed;
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform 	float _Light_PW;
uniform 	vec4 _Light_C;
uniform 	mediump vec3 _FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in highp float vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_14;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat16_0.w * _MainColor.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat1.x<0.0);
#else
    u_xlatb1.x = u_xlat1.x<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.5<_isCompressed);
#else
    u_xlatb1.x = 0.5<_isCompressed;
#endif
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    u_xlat16_14 = u_xlat16_0.w * _MainColor.w;
    SV_Target0.w = u_xlat16_14;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat16_3.xyz : u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat0.xyz = (-u_xlat16_2.xyz) * _MainColor.xyz + _FogColor.xyz;
    u_xlat0.xyz = vec3(vs_TEXCOORD4) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = texture(_Light, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(_Light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlatb1.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb1.x) ? vs_COLOR0.x : u_xlat0.x;
    u_xlat16_2.yz = (u_xlatb1.x) ? vec2(0.0, 0.0) : u_xlat0.yz;
    SV_Target0.xz = (u_xlatb1.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb1.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
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
Local Keywords { "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_VertexMoveGUI"
}