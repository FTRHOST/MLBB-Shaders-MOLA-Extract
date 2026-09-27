//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/CrystalUI2" {
Properties {

_MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_FW ("Cube_FW", Float) = 0.4000000059604645

_Cube_power ("Cube_power", Float) = 8.0

_Normal ("Normal", 2D) = "bump" { }

_R_A_G_Cube_B_FR ("R_A_G_Cube_B_FR", 2D) = "white" { }

_ExposeStrong ("ExposeStrong", Range(0, 3)) = 2.0

[Space(20)] _HideThredhold ("HideThredhold", Range(0, 1)) = 0.5

_HideSoftness ("HideSoftness", Range(0, 0.1)) = 0.10000000149011612

[Header(Dissolve)] _DissolveTex ("R:溶解纹理 G:溶解走向", 2D) = "white" { }

[Enum(1U,0,2U,1)] _Dissolve_UV ("溶解UV选择", Float) = 0.0

_DisDirWeight ("溶解走向权重", Range(0, 1)) = 0.5

_DissolveStep ("溶解阈值", Range(0, 2)) = 0.0

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveColorWidth ("溶解边缘粗细", Range(0, 1)) = 0.10000000149011612

_DissolveColorPW ("溶解边缘强度", Float) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 38990
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Dissolve_UV;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _R_A_G_Cube_B_FR_ST;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(2) uniform mediump sampler2D _R_A_G_Cube_B_FR;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD6;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
float u_xlat6;
float u_xlat10;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat3.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).x;
    u_xlat0 = (-u_xlat16_3) + u_xlat16_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat16_3;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat3.x = u_xlat0 + _DissolveColorWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<0.0);
#else
    u_xlatb3 = u_xlat3.x<0.0;
#endif
    if(u_xlatb3){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(-0.00100000005>=u_xlat0);
#else
    u_xlatb3 = -0.00100000005>=u_xlat0;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat16_2.zzz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat10 = dot((-u_xlat1.xyz), u_xlat3.xyz);
    u_xlat10 = u_xlat10 + u_xlat10;
    u_xlat3.xyz = u_xlat3.xyz * (-vec3(u_xlat10)) + (-u_xlat1.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat3.xyz);
    u_xlat3.x = u_xlat3.y + -1.0;
    u_xlat3.x = u_xlat3.x * 0.400000006 + 1.0;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6 = (-_Cube_FW) + 1.0;
    u_xlat6 = _Cube_FW * u_xlat6 + _Cube_FW;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat6);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat16_1.x = texture(_R_A_G_Cube_B_FR, u_xlat1.xy).y;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_1.xxx;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = log2(u_xlat16_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _MainColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_ExposeStrong);
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat3.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0 = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat3.x = float(1.0) / _HideSoftness;
    u_xlat0 = u_xlat3.x * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    SV_Target0.w = u_xlat0 * _MainColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Dissolve_UV;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _R_A_G_Cube_B_FR_ST;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(2) uniform mediump sampler2D _R_A_G_Cube_B_FR;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD6;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
float u_xlat6;
float u_xlat10;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat3.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_3 = texture(_DissolveTex, u_xlat3.xy).x;
    u_xlat0 = (-u_xlat16_3) + u_xlat16_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat16_3;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat3.x = u_xlat0 + _DissolveColorWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<0.0);
#else
    u_xlatb3 = u_xlat3.x<0.0;
#endif
    if(u_xlatb3){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(-0.00100000005>=u_xlat0);
#else
    u_xlatb3 = -0.00100000005>=u_xlat0;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat16_2.zzz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat10 = dot((-u_xlat1.xyz), u_xlat3.xyz);
    u_xlat10 = u_xlat10 + u_xlat10;
    u_xlat3.xyz = u_xlat3.xyz * (-vec3(u_xlat10)) + (-u_xlat1.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat3.xyz);
    u_xlat3.x = u_xlat3.y + -1.0;
    u_xlat3.x = u_xlat3.x * 0.400000006 + 1.0;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6 = (-_Cube_FW) + 1.0;
    u_xlat6 = _Cube_FW * u_xlat6 + _Cube_FW;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat6);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat16_1.x = texture(_R_A_G_Cube_B_FR, u_xlat1.xy).y;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_1.xxx;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = log2(u_xlat16_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _MainColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_ExposeStrong);
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat3.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0 = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat3.x = float(1.0) / _HideSoftness;
    u_xlat0 = u_xlat3.x * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    SV_Target0.w = u_xlat0 * _MainColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Dissolve_UV;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _R_A_G_Cube_B_FR_ST;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
uniform lowp sampler2D _Normal;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _R_A_G_Cube_B_FR;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
float u_xlat6;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat3.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).x;
    u_xlat0 = (-u_xlat10_3) + u_xlat10_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat3.x = u_xlat0 + _DissolveColorWidth;
    u_xlatb3 = u_xlat3.x<0.0;
    if(u_xlatb3){discard;}
    u_xlatb3 = -0.00100000005>=u_xlat0;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat3.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat16_2.zzz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat10 = dot((-u_xlat1.xyz), u_xlat3.xyz);
    u_xlat10 = u_xlat10 + u_xlat10;
    u_xlat3.xyz = u_xlat3.xyz * (-vec3(u_xlat10)) + (-u_xlat1.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat3.xyz);
    u_xlat3.x = u_xlat3.y + -1.0;
    u_xlat3.x = u_xlat3.x * 0.400000006 + 1.0;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6 = (-_Cube_FW) + 1.0;
    u_xlat6 = _Cube_FW * u_xlat6 + _Cube_FW;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat6);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat10_1.x = texture2D(_R_A_G_Cube_B_FR, u_xlat1.xy).y;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat10_1.xxx;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = log2(u_xlat10_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _MainColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_ExposeStrong);
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat3.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0 = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat3.x = float(1.0) / _HideSoftness;
    u_xlat0 = u_xlat3.x * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    SV_Target0.w = u_xlat0 * _MainColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Dissolve_UV;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD4.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	vec4 _Normal_ST;
uniform 	vec4 _R_A_G_Cube_B_FR_ST;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
uniform lowp sampler2D _Normal;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _R_A_G_Cube_B_FR;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
float u_xlat6;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat3.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_3 = texture2D(_DissolveTex, u_xlat3.xy).x;
    u_xlat0 = (-u_xlat10_3) + u_xlat10_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat10_3;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat3.x = u_xlat0 + _DissolveColorWidth;
    u_xlatb3 = u_xlat3.x<0.0;
    if(u_xlatb3){discard;}
    u_xlatb3 = -0.00100000005>=u_xlat0;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat3.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat3.xyz = u_xlat16_2.zzz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat10 = dot((-u_xlat1.xyz), u_xlat3.xyz);
    u_xlat10 = u_xlat10 + u_xlat10;
    u_xlat3.xyz = u_xlat3.xyz * (-vec3(u_xlat10)) + (-u_xlat1.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat3.xyz);
    u_xlat3.x = u_xlat3.y + -1.0;
    u_xlat3.x = u_xlat3.x * 0.400000006 + 1.0;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6 = (-_Cube_FW) + 1.0;
    u_xlat6 = _Cube_FW * u_xlat6 + _Cube_FW;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat6);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat10_1.x = texture2D(_R_A_G_Cube_B_FR, u_xlat1.xy).y;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat10_1.xxx;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = log2(u_xlat10_1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * _MainColor.xyz;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_ExposeStrong);
    u_xlat1.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat3.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0 = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat3.x = float(1.0) / _HideSoftness;
    u_xlat0 = u_xlat3.x * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat3.x = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat3.x;
    SV_Target0.w = u_xlat0 * _MainColor.w;
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
}
Fall back "MLBBBuiltin/Mobile/Diffuse"
}