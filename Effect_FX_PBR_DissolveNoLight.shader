//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_PBR_Dissolve(NoLight)" {
Properties {

_LightDir ("光照方向", Vector) = (0,0,-1,0)

_Cam_Offset ("观察位置偏移(适配正交相机)", Vector) = (0,0,0,0)

_Intensity ("整体强度", Float) = 1.0

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:菲涅尔遮罩", 2D) = "white" { }

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Intensity ("Cube强度", Float) = 1.0

[Space(10)] [Header(Effect)] _FresnelPower ("FresnelPower", Float) = 1.0

_FresnelScale ("FresnelScale", Float) = 1.0

_FresnelColor ("FresnelColor", Color) = (0,0,0,1)

[Enum(2U,0,ScreenUV,1)] _Flu_UV ("Flu_UV", Float) = 0.0

_Flu_Tex ("R:流光纹理 G:流光遮罩", 2D) = "black" { }

_Flu_Color ("流光颜色", Color) = (1,1,1,1)

_Flu_Speed_U ("流光流速U", Float) = 0.0

_Flu_Speed_V ("流光流速V", Float) = 0.0

_Flu_Power ("流光强度", Float) = 1.0

_DissolveTex ("R:溶解纹理 G:溶解走向", 2D) = "white" { }

[Enum(1U,0,2U,1)] _Dissolve_UV ("溶解UV选择", Float) = 0.0

_DisDirWeight ("溶解走向权重", Range(0, 1)) = 0.5

_DissolveStep ("溶解阈值", Range(0, 2)) = 0.0

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveColorWidth ("溶解边缘粗细", Range(0, 1)) = 0.10000000149011612

_DissolveColorPW ("溶解边缘强度", Float) = 1.0

[Space(10)] [Header(Stencil)] _StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 25871
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec3 _Cam_Offset;
uniform 	float _Dissolve_UV;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD4.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + _Cam_Offset.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD7.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _LightDir;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	vec4 _Flu_Tex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	mediump vec4 _Flu_Color;
uniform 	float _Flu_Speed_U;
uniform 	float _Flu_Speed_V;
uniform 	float _Flu_Power;
uniform 	float _DissolveStep;
uniform 	vec3 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
float u_xlat9;
mediump float u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD7.xy).y;
    u_xlat8.xy = vs_TEXCOORD7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_8 = texture(_DissolveTex, u_xlat8.xy).x;
    u_xlat0.x = (-u_xlat16_8) + u_xlat16_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat16_8;
    u_xlat0.x = u_xlat0.x + (-_DissolveStep);
    u_xlat8.x = u_xlat0.x + _DissolveColorWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<0.0);
#else
    u_xlatb8 = u_xlat8.x<0.0;
#endif
    if(u_xlatb8){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(-0.00100000005>=u_xlat0.x);
#else
    u_xlatb8 = -0.00100000005>=u_xlat0.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat1.xyz = _LightDir.xyz * u_xlat8.xxx + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = u_xlat8.xxx * _LightDir.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.yyy * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat16_4.xxx * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_4.zzz * vs_TEXCOORD2.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.w = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat8.xyz);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.xy = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat16.xy = u_xlat16.xy * u_xlat16.xy;
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat1.xy = u_xlat16_1.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat1.y * u_xlat1.y;
    u_xlat25 = u_xlat25 * u_xlat1.y;
    u_xlat24 = u_xlat16.y * u_xlat25 + (-u_xlat16.y);
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat26 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat26;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat16.x = u_xlat25 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat16.xxx * u_xlat5.xyz;
    u_xlat16.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat2.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16.xxx * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat8.xyz = u_xlat6.xyz * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD5.xyz), u_xlat3.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat2.xyz = u_xlat3.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD5.xyz);
    u_xlat25 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat16_3 = texture(_Cubemap, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_3.xyz;
    u_xlat10.xyz = u_xlat16_3.www * u_xlat10.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat26 = u_xlat25 * u_xlat25;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelPower;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelScale;
    u_xlat25 = u_xlat25 * _FresnelColor.w;
    u_xlat17 = u_xlat16_1.z * u_xlat25;
    u_xlat25 = u_xlat26 * u_xlat26;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat3.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyw = vec3(u_xlat25) * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyw = u_xlat1.xyw * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat8.xyz;
    u_xlat16_4.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat16_4.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV));
#else
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
#endif
    u_xlat1.xy = (bool(u_xlatb25)) ? u_xlat1.xy : vs_TEXCOORD0.zw;
    u_xlat1.xy = _Time.yy * vec2(_Flu_Speed_U, _Flu_Speed_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_1.x = texture(_Flu_Tex, u_xlat1.xy).x;
    u_xlat16_9 = texture(_Flu_Tex, vs_TEXCOORD0.zw).y;
    u_xlat1.x = u_xlat16_9 * u_xlat16_1.x;
    u_xlat1.xyw = u_xlat1.xxx * _Flu_Color.xyz;
    u_xlat1.xyw = u_xlat1.xyw * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat1.xyz = vec3(u_xlat17) * _FresnelColor.xyz + u_xlat1.xyw;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat1.xyz;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat8.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec3 _Cam_Offset;
uniform 	float _Dissolve_UV;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD4.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + _Cam_Offset.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD7.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _LightDir;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	vec4 _Flu_Tex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	mediump vec4 _Flu_Color;
uniform 	float _Flu_Speed_U;
uniform 	float _Flu_Speed_V;
uniform 	float _Flu_Power;
uniform 	float _DissolveStep;
uniform 	vec3 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump float u_xlat16_8;
bool u_xlatb8;
float u_xlat9;
mediump float u_xlat16_9;
vec3 u_xlat10;
vec2 u_xlat16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD7.xy).y;
    u_xlat8.xy = vs_TEXCOORD7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_8 = texture(_DissolveTex, u_xlat8.xy).x;
    u_xlat0.x = (-u_xlat16_8) + u_xlat16_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat16_8;
    u_xlat0.x = u_xlat0.x + (-_DissolveStep);
    u_xlat8.x = u_xlat0.x + _DissolveColorWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x<0.0);
#else
    u_xlatb8 = u_xlat8.x<0.0;
#endif
    if(u_xlatb8){discard;}
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(-0.00100000005>=u_xlat0.x);
#else
    u_xlatb8 = -0.00100000005>=u_xlat0.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat1.xyz = _LightDir.xyz * u_xlat8.xxx + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = u_xlat8.xxx * _LightDir.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_3.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.yyy * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat16_4.xxx * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_4.zzz * vs_TEXCOORD2.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.w = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat8.xyz);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16.xy = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat16.xy = u_xlat16.xy * u_xlat16.xy;
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat16_1.xyz = texture(_Metal_Rough_Skin, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat1.xy = u_xlat16_1.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat1.y * u_xlat1.y;
    u_xlat25 = u_xlat25 * u_xlat1.y;
    u_xlat24 = u_xlat16.y * u_xlat25 + (-u_xlat16.y);
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat26 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat26;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat16.x = u_xlat25 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat16.xxx * u_xlat5.xyz;
    u_xlat16.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat2.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16.xxx * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat8.xyz = u_xlat6.xyz * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD5.xyz), u_xlat3.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat2.xyz = u_xlat3.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD5.xyz);
    u_xlat25 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat16_3 = texture(_Cubemap, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat16_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat16_3.xyz;
    u_xlat10.xyz = u_xlat16_3.www * u_xlat10.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat26 = u_xlat25 * u_xlat25;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelPower;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelScale;
    u_xlat25 = u_xlat25 * _FresnelColor.w;
    u_xlat17 = u_xlat16_1.z * u_xlat25;
    u_xlat25 = u_xlat26 * u_xlat26;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat3.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyw = vec3(u_xlat25) * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyw = u_xlat1.xyw * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat8.xyz;
    u_xlat16_4.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat16_4.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV));
#else
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
#endif
    u_xlat1.xy = (bool(u_xlatb25)) ? u_xlat1.xy : vs_TEXCOORD0.zw;
    u_xlat1.xy = _Time.yy * vec2(_Flu_Speed_U, _Flu_Speed_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_1.x = texture(_Flu_Tex, u_xlat1.xy).x;
    u_xlat16_9 = texture(_Flu_Tex, vs_TEXCOORD0.zw).y;
    u_xlat1.x = u_xlat16_9 * u_xlat16_1.x;
    u_xlat1.xyw = u_xlat1.xxx * _Flu_Color.xyz;
    u_xlat1.xyw = u_xlat1.xyw * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat1.xyz = vec3(u_xlat17) * _FresnelColor.xyz + u_xlat1.xyw;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat1.xyz;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat8.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec3 _Cam_Offset;
uniform 	float _Dissolve_UV;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD4.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + _Cam_Offset.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD7.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _LightDir;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	vec4 _Flu_Tex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	mediump vec4 _Flu_Color;
uniform 	float _Flu_Speed_U;
uniform 	float _Flu_Speed_V;
uniform 	float _Flu_Power;
uniform 	float _DissolveStep;
uniform 	vec3 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp float u_xlat10_8;
bool u_xlatb8;
float u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
vec2 u_xlat16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD7.xy).y;
    u_xlat8.xy = vs_TEXCOORD7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_8 = texture2D(_DissolveTex, u_xlat8.xy).x;
    u_xlat0.x = (-u_xlat10_8) + u_xlat10_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat10_8;
    u_xlat0.x = u_xlat0.x + (-_DissolveStep);
    u_xlat8.x = u_xlat0.x + _DissolveColorWidth;
    u_xlatb8 = u_xlat8.x<0.0;
    if(u_xlatb8){discard;}
    u_xlatb8 = -0.00100000005>=u_xlat0.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat1.xyz = _LightDir.xyz * u_xlat8.xxx + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = u_xlat8.xxx * _LightDir.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.yyy * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat16_4.xxx * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_4.zzz * vs_TEXCOORD2.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.w = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat8.xyz);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.xy = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat16.xy = u_xlat16.xy * u_xlat16.xy;
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat10_1.xyz = texture2D(_Metal_Rough_Skin, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    u_xlat1.xy = u_xlat10_1.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat25 = u_xlat1.y * u_xlat1.y;
    u_xlat25 = u_xlat25 * u_xlat1.y;
    u_xlat24 = u_xlat16.y * u_xlat25 + (-u_xlat16.y);
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat26 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat26;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat16.x = u_xlat25 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat16.xxx * u_xlat5.xyz;
    u_xlat16.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat2.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16.xxx * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat8.xyz = u_xlat6.xyz * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD5.xyz), u_xlat3.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat2.xyz = u_xlat3.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD5.xyz);
    u_xlat25 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat10_3.xyz;
    u_xlat10.xyz = u_xlat10_3.www * u_xlat10.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat26 = u_xlat25 * u_xlat25;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelPower;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelScale;
    u_xlat25 = u_xlat25 * _FresnelColor.w;
    u_xlat17 = u_xlat10_1.z * u_xlat25;
    u_xlat25 = u_xlat26 * u_xlat26;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat3.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyw = vec3(u_xlat25) * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyw = u_xlat1.xyw * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat8.xyz;
    u_xlat16_4.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat16_4.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
    u_xlat1.xy = (bool(u_xlatb25)) ? u_xlat1.xy : vs_TEXCOORD0.zw;
    u_xlat1.xy = _Time.yy * vec2(_Flu_Speed_U, _Flu_Speed_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_1.x = texture2D(_Flu_Tex, u_xlat1.xy).x;
    u_xlat10_9 = texture2D(_Flu_Tex, vs_TEXCOORD0.zw).y;
    u_xlat1.x = u_xlat10_9 * u_xlat10_1.x;
    u_xlat1.xyw = u_xlat1.xxx * _Flu_Color.xyz;
    u_xlat1.xyw = u_xlat1.xyw * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat1.xyz = vec3(u_xlat17) * _FresnelColor.xyz + u_xlat1.xyw;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat1.xyz;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat8.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec3 _Cam_Offset;
uniform 	float _Dissolve_UV;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1 = u_xlat0;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    vs_TEXCOORD4.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat2.xyz = _WorldSpaceCameraPos.xyz + _Cam_Offset.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD7.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec3 _LightDir;
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _FresnelScale;
uniform 	float _FresnelPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	vec4 _Flu_Tex_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	mediump vec4 _Flu_Color;
uniform 	float _Flu_Speed_U;
uniform 	float _Flu_Speed_V;
uniform 	float _Flu_Power;
uniform 	float _DissolveStep;
uniform 	vec3 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp float u_xlat10_8;
bool u_xlatb8;
float u_xlat9;
lowp float u_xlat10_9;
vec3 u_xlat10;
vec2 u_xlat16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD7.xy).y;
    u_xlat8.xy = vs_TEXCOORD7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_8 = texture2D(_DissolveTex, u_xlat8.xy).x;
    u_xlat0.x = (-u_xlat10_8) + u_xlat10_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat10_8;
    u_xlat0.x = u_xlat0.x + (-_DissolveStep);
    u_xlat8.x = u_xlat0.x + _DissolveColorWidth;
    u_xlatb8 = u_xlat8.x<0.0;
    if(u_xlatb8){discard;}
    u_xlatb8 = -0.00100000005>=u_xlat0.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat8.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat8.x = inversesqrt(u_xlat8.x);
    u_xlat1.xyz = _LightDir.xyz * u_xlat8.xxx + vs_TEXCOORD5.xyz;
    u_xlat8.xyz = u_xlat8.xxx * _LightDir.xyz;
    u_xlat25 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat1.xyz = vec3(u_xlat25) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_3.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.yyy * vs_TEXCOORD4.xyz;
    u_xlat3.xyz = u_xlat16_4.xxx * vs_TEXCOORD3.xyz + u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_4.zzz * vs_TEXCOORD2.xyz + u_xlat3.xyz;
    u_xlat25 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat3.xyz;
    u_xlat1.w = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat8.xyz);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat8.xyz);
    u_xlat8.x = u_xlat8.x * 0.5 + 0.5;
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
    u_xlat16.xy = max(u_xlat1.xw, vec2(0.0, 0.0));
    u_xlat16.xy = u_xlat16.xy * u_xlat16.xy;
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat10_1.xyz = texture2D(_Metal_Rough_Skin, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    u_xlat1.xy = u_xlat10_1.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat25 = u_xlat1.y * u_xlat1.y;
    u_xlat25 = u_xlat25 * u_xlat1.y;
    u_xlat24 = u_xlat16.y * u_xlat25 + (-u_xlat16.y);
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat26 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat26;
    u_xlat16.x = u_xlat16.x * u_xlat24;
    u_xlat16.x = u_xlat25 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat2.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat16.xxx * u_xlat5.xyz;
    u_xlat16.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat2.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat16.xxx * _Ambient_Color.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz;
    u_xlat8.xyz = u_xlat6.xyz * u_xlat8.xxx + u_xlat2.xyz;
    u_xlat25 = dot((-vs_TEXCOORD5.xyz), u_xlat3.xyz);
    u_xlat25 = u_xlat25 + u_xlat25;
    u_xlat2.xyz = u_xlat3.xyz * (-vec3(u_xlat25)) + (-vs_TEXCOORD5.xyz);
    u_xlat25 = dot(u_xlat3.xyz, vs_TEXCOORD5.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat2.xyz);
    u_xlat2.x = u_xlat2.y * 0.200000003 + 0.800000012;
    u_xlat10.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat10.xyz = u_xlat10_3.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10.xyz * u_xlat10_3.xyz;
    u_xlat10.xyz = u_xlat10_3.www * u_xlat10.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat10.xyz;
    u_xlat26 = u_xlat25 * u_xlat25;
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelPower;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _FresnelScale;
    u_xlat25 = u_xlat25 * _FresnelColor.w;
    u_xlat17 = u_xlat10_1.z * u_xlat25;
    u_xlat25 = u_xlat26 * u_xlat26;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat3.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat5.xyz = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat5.xyz = max(u_xlat5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyw = vec3(u_xlat25) * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat1.xyw = u_xlat1.xyw * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat1.xyw * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat8.xyz;
    u_xlat16_4.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat8.xyz = log2(u_xlat16_4.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat8.xyz = exp2(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb25 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
    u_xlat1.xy = (bool(u_xlatb25)) ? u_xlat1.xy : vs_TEXCOORD0.zw;
    u_xlat1.xy = _Time.yy * vec2(_Flu_Speed_U, _Flu_Speed_V) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_1.x = texture2D(_Flu_Tex, u_xlat1.xy).x;
    u_xlat10_9 = texture2D(_Flu_Tex, vs_TEXCOORD0.zw).y;
    u_xlat1.x = u_xlat10_9 * u_xlat10_1.x;
    u_xlat1.xyw = u_xlat1.xxx * _Flu_Color.xyz;
    u_xlat1.xyw = u_xlat1.xyw * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat1.xyz = vec3(u_xlat17) * _FresnelColor.xyz + u_xlat1.xyw;
    u_xlat8.xyz = u_xlat8.xyz + u_xlat1.xyz;
    u_xlat1.xyz = _DissolveColor.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW)) + (-u_xlat8.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat8.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0.xyz = u_xlat0.xyz;
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
}
}
}
}