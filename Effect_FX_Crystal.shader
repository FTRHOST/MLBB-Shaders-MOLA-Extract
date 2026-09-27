//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_Crystal" {
Properties {

_MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_MaskTex ("MaskTex", 2D) = "white" { }

[Toggle] _MaskUse2U ("Mask使用2U", Float) = 0.0

_FrMask_Range ("菲涅尔半透范围", Range(0, 1)) = 0.0

_FrMask_Intensity ("菲涅尔半透强度", Range(0, 1)) = 0.0

_FrMask_Softness ("菲涅尔半透软边", Range(0, 1)) = 1.0

[Toggle] _Reverse_Fr ("反向菲涅尔半透", Float) = 0.0

_Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_FW ("Cube_FW", Float) = 0.4000000059604645

_Cube_power ("Cube_power", Float) = 8.0

[Toggle] _UseRefract ("半透部分显示为折射", Float) = 0.0

_RefractCube ("折射Cube", Cube) = "_Skybox" { }

_RefractRatio ("折射率", Range(0, 1)) = 0.5

_RefractScale ("折射Cube缩放", Range(0, 20)) = 1.0

_RefractCube_Rotation_Y ("折射CubeY轴旋转角度", Float) = 0.0

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
  GpuProgramID 47334
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
uniform 	vec3 _WorldSpaceCameraPos;
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
out highp vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD6.xy = (bool(u_xlatb12)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD7.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MaskTex_ST;
uniform 	float _FrMask_Range;
uniform 	float _FrMask_Intensity;
uniform 	float _FrMask_Softness;
uniform 	float _Reverse_Fr;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _UseRefract;
uniform 	float _RefractRatio;
uniform 	float _RefractScale;
uniform 	float _RefractCube_Rotation_Y;
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
UNITY_LOCATION(1) uniform mediump samplerCube _RefractCube;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _R_A_G_Cube_B_FR;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
mediump float u_xlat16_12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_19;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat6.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat0 = (-u_xlat16_6) + u_xlat16_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat16_6;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat6.x = u_xlat0 + _DissolveColorWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x<0.0);
#else
    u_xlatb6 = u_xlat6.x<0.0;
#endif
    if(u_xlatb6){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(-0.00100000005>=u_xlat0);
#else
    u_xlatb6 = -0.00100000005>=u_xlat0;
#endif
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat16_2.zzz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-vs_TEXCOORD7.xyz), u_xlat6.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat6.xyz * (-u_xlat1.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_2 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.y + -1.0;
    u_xlat1.x = u_xlat1.x * 0.400000006 + 1.0;
    u_xlat7.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat3.x = (-_Cube_FW) + 1.0;
    u_xlat3.x = _Cube_FW * u_xlat3.x + _Cube_FW;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat3.xxx;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat16_19 = texture(_R_A_G_Cube_B_FR, u_xlat3.xy).y;
    u_xlat1.xyz = vec3(u_xlat16_19) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat3.xyz = log2(u_xlat16_3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy * (-vec2(_RefractScale));
    u_xlat3.z = vs_TEXCOORD7.z * -1.0;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat21 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat4.x = _RefractRatio * _RefractRatio;
    u_xlat21 = (-u_xlat4.x) * u_xlat21 + 1.0;
    u_xlat4.x = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21>=0.0);
#else
    u_xlatb21 = u_xlat21>=0.0;
#endif
    u_xlat19 = _RefractRatio * u_xlat19 + u_xlat4.x;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat19);
    u_xlat6.x = dot(vs_TEXCOORD7.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(vec3(_RefractRatio, _RefractRatio, _RefractRatio)) * u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = bool(u_xlatb21) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat12.x = _RefractCube_Rotation_Y * 0.0174533334;
    u_xlat4.x = sin(u_xlat12.x);
    u_xlat5 = cos(u_xlat12.x);
    u_xlat12.xy = u_xlat3.zx * u_xlat4.xx;
    u_xlat3.x = u_xlat3.x * u_xlat5 + (-u_xlat12.x);
    u_xlat3.z = u_xlat3.z * u_xlat5 + u_xlat12.y;
    u_xlat16_3.xyz = texture(_RefractCube, u_xlat3.xyz).xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + (-u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ExposeStrong);
    u_xlat12.x = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Reverse_Fr));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Reverse_Fr);
#endif
    u_xlat6.x = (u_xlatb18) ? u_xlat12.x : u_xlat6.x;
    u_xlat6.x = u_xlat6.x + (-_FrMask_Range);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = float(1.0) / _FrMask_Softness;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = (-u_xlat12.x) * u_xlat6.x + 1.0;
    u_xlat6.x = (-u_xlat6.x) * _FrMask_Intensity + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_12 = texture(_MaskTex, u_xlat12.xy).x;
    u_xlat6.x = u_xlat6.x * u_xlat16_12;
    u_xlat2.xyz = u_xlat6.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat12.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat18 = float(1.0) / _HideSoftness;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat2.w = u_xlat12.x * u_xlat18;
    u_xlat1.w = u_xlat6.x * u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_UseRefract==0.0);
#else
    u_xlatb6 = _UseRefract==0.0;
#endif
    u_xlat1 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    u_xlat6.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w * _MainColor.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
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
out highp vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD6.xy = (bool(u_xlatb12)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD7.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MaskTex_ST;
uniform 	float _FrMask_Range;
uniform 	float _FrMask_Intensity;
uniform 	float _FrMask_Softness;
uniform 	float _Reverse_Fr;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _UseRefract;
uniform 	float _RefractRatio;
uniform 	float _RefractScale;
uniform 	float _RefractCube_Rotation_Y;
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
UNITY_LOCATION(1) uniform mediump samplerCube _RefractCube;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _R_A_G_Cube_B_FR;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(6) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD7;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
mediump float u_xlat16_12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
mediump float u_xlat16_19;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat6.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat0 = (-u_xlat16_6) + u_xlat16_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat16_6;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat6.x = u_xlat0 + _DissolveColorWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x<0.0);
#else
    u_xlatb6 = u_xlat6.x<0.0;
#endif
    if(u_xlatb6){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(-0.00100000005>=u_xlat0);
#else
    u_xlatb6 = -0.00100000005>=u_xlat0;
#endif
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat16_2.zzz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-vs_TEXCOORD7.xyz), u_xlat6.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat6.xyz * (-u_xlat1.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16_2 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.y + -1.0;
    u_xlat1.x = u_xlat1.x * 0.400000006 + 1.0;
    u_xlat7.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat3.x = (-_Cube_FW) + 1.0;
    u_xlat3.x = _Cube_FW * u_xlat3.x + _Cube_FW;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat3.xxx;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat16_19 = texture(_R_A_G_Cube_B_FR, u_xlat3.xy).y;
    u_xlat1.xyz = vec3(u_xlat16_19) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
    u_xlat3.xyz = log2(u_xlat16_3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy * (-vec2(_RefractScale));
    u_xlat3.z = vs_TEXCOORD7.z * -1.0;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat21 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat4.x = _RefractRatio * _RefractRatio;
    u_xlat21 = (-u_xlat4.x) * u_xlat21 + 1.0;
    u_xlat4.x = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21>=0.0);
#else
    u_xlatb21 = u_xlat21>=0.0;
#endif
    u_xlat19 = _RefractRatio * u_xlat19 + u_xlat4.x;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat19);
    u_xlat6.x = dot(vs_TEXCOORD7.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(vec3(_RefractRatio, _RefractRatio, _RefractRatio)) * u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = bool(u_xlatb21) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat12.x = _RefractCube_Rotation_Y * 0.0174533334;
    u_xlat4.x = sin(u_xlat12.x);
    u_xlat5 = cos(u_xlat12.x);
    u_xlat12.xy = u_xlat3.zx * u_xlat4.xx;
    u_xlat3.x = u_xlat3.x * u_xlat5 + (-u_xlat12.x);
    u_xlat3.z = u_xlat3.z * u_xlat5 + u_xlat12.y;
    u_xlat16_3.xyz = texture(_RefractCube, u_xlat3.xyz).xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + (-u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ExposeStrong);
    u_xlat12.x = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Reverse_Fr));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Reverse_Fr);
#endif
    u_xlat6.x = (u_xlatb18) ? u_xlat12.x : u_xlat6.x;
    u_xlat6.x = u_xlat6.x + (-_FrMask_Range);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = float(1.0) / _FrMask_Softness;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = (-u_xlat12.x) * u_xlat6.x + 1.0;
    u_xlat6.x = (-u_xlat6.x) * _FrMask_Intensity + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_12 = texture(_MaskTex, u_xlat12.xy).x;
    u_xlat6.x = u_xlat6.x * u_xlat16_12;
    u_xlat2.xyz = u_xlat6.xxx * u_xlat4.xyz + u_xlat16_3.xyz;
    u_xlat12.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat18 = float(1.0) / _HideSoftness;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat2.w = u_xlat12.x * u_xlat18;
    u_xlat1.w = u_xlat6.x * u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_UseRefract==0.0);
#else
    u_xlatb6 = _UseRefract==0.0;
#endif
    u_xlat1 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    u_xlat6.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w * _MainColor.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
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
varying highp vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD6.xy = (bool(u_xlatb12)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD7.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MaskTex_ST;
uniform 	float _FrMask_Range;
uniform 	float _FrMask_Intensity;
uniform 	float _FrMask_Softness;
uniform 	float _Reverse_Fr;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _UseRefract;
uniform 	float _RefractRatio;
uniform 	float _RefractScale;
uniform 	float _RefractCube_Rotation_Y;
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
uniform lowp samplerCube _RefractCube;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _R_A_G_Cube_B_FR;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD6;
varying highp vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
lowp float u_xlat10_12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
lowp float u_xlat10_19;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat6.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat0 = (-u_xlat10_6) + u_xlat10_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat10_6;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat6.x = u_xlat0 + _DissolveColorWidth;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlatb6 = -0.00100000005>=u_xlat0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat6.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat16_2.zzz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-vs_TEXCOORD7.xyz), u_xlat6.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat6.xyz * (-u_xlat1.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_2 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.y + -1.0;
    u_xlat1.x = u_xlat1.x * 0.400000006 + 1.0;
    u_xlat7.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat3.x = (-_Cube_FW) + 1.0;
    u_xlat3.x = _Cube_FW * u_xlat3.x + _Cube_FW;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat3.xxx;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat10_19 = texture2D(_R_A_G_Cube_B_FR, u_xlat3.xy).y;
    u_xlat1.xyz = vec3(u_xlat10_19) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat3.xyz = log2(u_xlat10_3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy * (-vec2(_RefractScale));
    u_xlat3.z = vs_TEXCOORD7.z * -1.0;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat21 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat4.x = _RefractRatio * _RefractRatio;
    u_xlat21 = (-u_xlat4.x) * u_xlat21 + 1.0;
    u_xlat4.x = sqrt(u_xlat21);
    u_xlatb21 = u_xlat21>=0.0;
    u_xlat19 = _RefractRatio * u_xlat19 + u_xlat4.x;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat19);
    u_xlat6.x = dot(vs_TEXCOORD7.xyz, u_xlat6.xyz);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat3.xyz = vec3(vec3(_RefractRatio, _RefractRatio, _RefractRatio)) * u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = bool(u_xlatb21) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat12.x = _RefractCube_Rotation_Y * 0.0174533334;
    u_xlat4.x = sin(u_xlat12.x);
    u_xlat5 = cos(u_xlat12.x);
    u_xlat12.xy = u_xlat3.zx * u_xlat4.xx;
    u_xlat3.x = u_xlat3.x * u_xlat5 + (-u_xlat12.x);
    u_xlat3.z = u_xlat3.z * u_xlat5 + u_xlat12.y;
    u_xlat10_3.xyz = textureCube(_RefractCube, u_xlat3.xyz).xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + (-u_xlat10_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ExposeStrong);
    u_xlat12.x = (-u_xlat6.x) + 1.0;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Reverse_Fr);
    u_xlat6.x = (u_xlatb18) ? u_xlat12.x : u_xlat6.x;
    u_xlat6.x = u_xlat6.x + (-_FrMask_Range);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = float(1.0) / _FrMask_Softness;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = (-u_xlat12.x) * u_xlat6.x + 1.0;
    u_xlat6.x = (-u_xlat6.x) * _FrMask_Intensity + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_12 = texture2D(_MaskTex, u_xlat12.xy).x;
    u_xlat6.x = u_xlat6.x * u_xlat10_12;
    u_xlat2.xyz = u_xlat6.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
    u_xlat12.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat18 = float(1.0) / _HideSoftness;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat2.w = u_xlat12.x * u_xlat18;
    u_xlat1.w = u_xlat6.x * u_xlat2.w;
    u_xlatb6 = _UseRefract==0.0;
    u_xlat1 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    u_xlat6.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w * _MainColor.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
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
varying highp vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD6.xy = (bool(u_xlatb12)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD7.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MaskTex_ST;
uniform 	float _FrMask_Range;
uniform 	float _FrMask_Intensity;
uniform 	float _FrMask_Softness;
uniform 	float _Reverse_Fr;
uniform 	vec4 _MainColor;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _UseRefract;
uniform 	float _RefractRatio;
uniform 	float _RefractScale;
uniform 	float _RefractCube_Rotation_Y;
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
uniform lowp samplerCube _RefractCube;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _R_A_G_Cube_B_FR;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec2 vs_TEXCOORD6;
varying highp vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
lowp float u_xlat10_12;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
lowp float u_xlat10_19;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat6.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat0 = (-u_xlat10_6) + u_xlat10_0;
    u_xlat0 = _DisDirWeight * u_xlat0 + u_xlat10_6;
    u_xlat0 = u_xlat0 + (-_DissolveStep);
    u_xlat6.x = u_xlat0 + _DissolveColorWidth;
    u_xlatb6 = u_xlat6.x<0.0;
    if(u_xlatb6){discard;}
    u_xlatb6 = -0.00100000005>=u_xlat0;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat0) + u_xlat6.x;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat16_2.zzz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-vs_TEXCOORD7.xyz), u_xlat6.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat6.xyz * (-u_xlat1.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat10_2 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.y + -1.0;
    u_xlat1.x = u_xlat1.x * 0.400000006 + 1.0;
    u_xlat7.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat3.x = (-_Cube_FW) + 1.0;
    u_xlat3.x = _Cube_FW * u_xlat3.x + _Cube_FW;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat3.xxx;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat7.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _R_A_G_Cube_B_FR_ST.xy + _R_A_G_Cube_B_FR_ST.zw;
    u_xlat10_19 = texture2D(_R_A_G_Cube_B_FR, u_xlat3.xy).y;
    u_xlat1.xyz = vec3(u_xlat10_19) * u_xlat1.xyz;
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.5, 0.5, 0.5));
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
    u_xlat3.xyz = log2(u_xlat10_3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.75, 0.75, 0.75);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _MainColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD7.xy * (-vec2(_RefractScale));
    u_xlat3.z = vs_TEXCOORD7.z * -1.0;
    u_xlat19 = dot(u_xlat3.xyz, u_xlat6.xyz);
    u_xlat21 = (-u_xlat19) * u_xlat19 + 1.0;
    u_xlat4.x = _RefractRatio * _RefractRatio;
    u_xlat21 = (-u_xlat4.x) * u_xlat21 + 1.0;
    u_xlat4.x = sqrt(u_xlat21);
    u_xlatb21 = u_xlat21>=0.0;
    u_xlat19 = _RefractRatio * u_xlat19 + u_xlat4.x;
    u_xlat4.xyz = u_xlat6.xyz * vec3(u_xlat19);
    u_xlat6.x = dot(vs_TEXCOORD7.xyz, u_xlat6.xyz);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat3.xyz = vec3(vec3(_RefractRatio, _RefractRatio, _RefractRatio)) * u_xlat3.xyz + (-u_xlat4.xyz);
    u_xlat3.xyz = bool(u_xlatb21) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat12.x = _RefractCube_Rotation_Y * 0.0174533334;
    u_xlat4.x = sin(u_xlat12.x);
    u_xlat5 = cos(u_xlat12.x);
    u_xlat12.xy = u_xlat3.zx * u_xlat4.xx;
    u_xlat3.x = u_xlat3.x * u_xlat5 + (-u_xlat12.x);
    u_xlat3.z = u_xlat3.z * u_xlat5 + u_xlat12.y;
    u_xlat10_3.xyz = textureCube(_RefractCube, u_xlat3.xyz).xyz;
    u_xlat4.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + (-u_xlat10_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ExposeStrong);
    u_xlat12.x = (-u_xlat6.x) + 1.0;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Reverse_Fr);
    u_xlat6.x = (u_xlatb18) ? u_xlat12.x : u_xlat6.x;
    u_xlat6.x = u_xlat6.x + (-_FrMask_Range);
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = float(1.0) / _FrMask_Softness;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat12.x = u_xlat6.x * -2.0 + 3.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = (-u_xlat12.x) * u_xlat6.x + 1.0;
    u_xlat6.x = (-u_xlat6.x) * _FrMask_Intensity + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_12 = texture2D(_MaskTex, u_xlat12.xy).x;
    u_xlat6.x = u_xlat6.x * u_xlat10_12;
    u_xlat2.xyz = u_xlat6.xxx * u_xlat4.xyz + u_xlat10_3.xyz;
    u_xlat12.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat18 = float(1.0) / _HideSoftness;
    u_xlat12.x = u_xlat18 * u_xlat12.x;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat18 = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat2.w = u_xlat12.x * u_xlat18;
    u_xlat1.w = u_xlat6.x * u_xlat2.w;
    u_xlatb6 = _UseRefract==0.0;
    u_xlat1 = (bool(u_xlatb6)) ? u_xlat1 : u_xlat2;
    u_xlat6.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW) + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w * _MainColor.w;
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