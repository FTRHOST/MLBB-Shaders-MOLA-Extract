//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Show2.0_Laser&2LG&Dissolve&ChangeColor_Alpha" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_Alpha ("MainTex不透明度", Range(0, 1)) = 1.0

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_AdditionalRefAlpha ("反射部分不透明度", Range(0, 10)) = 0.0

_MainTex ("MainTex", 2D) = "white" { }

_MainColor2 ("MainTex2", Color) = (1,1,1,1)

[Toggle] _ChangeMainTex ("切换主帖图开关(包含菲涅尔）", Float) = 0.0

_Normal ("法线贴图", 2D) = "bump" { }

_EmissionTex ("RGB:自发光贴图, A:菲涅尔遮罩", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:镭射遮罩", 2D) = "white" { }

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Intensity ("Cube强度", Float) = 1.0

[Space(10)] [Header(Laser)] _LaserRamp ("镭射渐变图", 2D) = "black" { }

_LaserRamp_Intensity ("镭射强度", Float) = 1.0

[Space(10)] [Header(LiuGuang)] _LG_UVMap ("RGB:流光1RGB", 2D) = "white" { }

_LG_Mask ("R:流光1遮罩 G:流光2遮罩，B:流光2遮罩2（更细一点的版本),流光都使用2U", 2D) = "white" { }

_LG2_MaskSlider ("流光2遮罩粗细", Range(0, 1)) = 0.5

_LG_Color ("流光1颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光1强度", Float) = 0.0

_LG_Tex ("流光2纹理(RGB)", 2D) = "black" { }

_LG2_Color ("流光2颜色", Color) = (1,1,1,1)

_LG2_Intensity ("流光2强度", Float) = 0.0

_LG_Speed ("XY:流光1流速 ZW:流光2流速", Vector) = (0,0,0,0)

[Toggle] _Exchange_LGTex ("交换1,2流光纹理", Float) = 0.0

[Header(RongJie)] [Toggle] _Dissovle_Use_3U ("溶解使用3U", Float) = 1.0

[Enum(LeftRight,0,DownUp,1,NoUV,2)] _Dissolve_Dir ("溶解UV方向", Float) = 0.0

_Rongjie_Tiling_Offset ("溶解纹理_Tiling_Offset", Vector) = (1,1,0,0)

_DissolveColor ("拖尾颜色", Color) = (1,1,1,1)

_Rongjie_Fanwei ("边缘压缩", Float) = 4.0

_Rongjie_Color_Fanwei ("拖尾范围", Float) = 1.0

_DissolveColor_Power ("拖尾强度", Float) = 1.0

_ClipAmount ("溶解进度", Range(-2, 1)) = 1.0

_FresColor ("菲涅尔颜色1", Color) = (0,0,0,0)

_Fres_Power ("菲涅尔范围1", Float) = 1.0

_Fres_Sacle ("菲涅尔强度1", Float) = 1.0

_FresColor2 ("菲涅尔颜色2", Color) = (0,0,0,0)

_Fres_Power2 ("菲涅尔范围2", Float) = 1.0

_Fres_Sacle2 ("菲涅尔强度2", Float) = 1.0

[Space(10)] [Header(Shadow)] _Delta_ShadowCenter ("接收投影中心坐标偏移（默认模型中心点,w=-1取消遮罩）", Vector) = (0,0,0,0)

_ShadowIntensity ("接收投影强度", Range(0, 2)) = 1.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" }
  GpuProgramID 169793
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
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
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "SHADOWSUPPORT" = "true" }
 ZWrite Off
  GpuProgramID 54129
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat31 = 1.0;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(4) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(8) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(10) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(11) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec3 u_xlat16_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
mediump float u_xlat16_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat44);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(u_xlat44>=1.0);
#else
        u_xlatb31 = u_xlat44>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb45 = !!(0.0>=u_xlat44);
#else
        u_xlatb45 = 0.0>=u_xlat44;
#endif
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb45 = !!(0.0<_UsePCF);
#else
            u_xlatb45 = 0.0<_UsePCF;
#endif
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat16_20 = textureLod(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat16_20) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb20 = !!(u_xlat44<u_xlat20.x);
#else
                        u_xlatb20 = u_xlat44<u_xlat20.x;
#endif
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat16_45 = textureLod(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat16_45) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb44 = !!(u_xlat44<u_xlat45);
#else
                u_xlatb44 = u_xlat44<u_xlat45;
#endif
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat16_8 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat16_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat16_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat16_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_8.xyz = texture(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat16_9.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat16_9.z + u_xlat16_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(u_xlat16.y<0.0);
#else
    u_xlatb30 = u_xlat16.y<0.0;
#endif
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_10 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat16_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat16_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD7.xyz = u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	vec4 _ShadowOffsets[4];
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat6;
lowp vec3 u_xlat10_6;
bvec2 u_xlatb6;
vec3 u_xlat7;
vec3 u_xlat8;
lowp vec4 u_xlat10_8;
bvec2 u_xlatb8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
vec3 u_xlat16;
bool u_xlatb16;
vec2 u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat30;
bool u_xlatb30;
float u_xlat31;
bool u_xlatb31;
float u_xlat33;
bvec2 u_xlatb33;
bool u_xlatb34;
float u_xlat42;
mediump float u_xlat16_43;
float u_xlat44;
bool u_xlatb44;
float u_xlat45;
lowp float u_xlat10_45;
bool u_xlatb45;
float u_xlat46;
int u_xlati46;
int u_xlati47;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat42 = inversesqrt(u_xlat42);
    u_xlat0.xyz = vec3(u_xlat42) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_43 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_43 = inversesqrt(u_xlat16_43);
    u_xlat16_1.xyz = vec3(u_xlat16_43) * u_xlat16_1.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat42 = max(u_xlat42, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat16.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat16.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16.xy = max(u_xlat16.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat16.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat44 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat44);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb44 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb44){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat5.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat44 = (-u_xlat5.z) + 1.0;
        u_xlatb31 = u_xlat44>=1.0;
        u_xlatb45 = 0.0>=u_xlat44;
        u_xlatb31 = u_xlatb45 || u_xlatb31;
        u_xlatb33.xy = lessThan(u_xlat5.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb33.x;
        u_xlatb6.xy = lessThan(vec4(1.0, 1.0, 0.0, 0.0), u_xlat5.xyxx).xy;
        u_xlatb31 = u_xlatb31 || u_xlatb6.x;
        u_xlatb31 = u_xlatb33.y || u_xlatb31;
        u_xlatb31 = u_xlatb6.y || u_xlatb31;
        if(u_xlatb31){
            u_xlat31 = 1.0;
        } else {
            u_xlatb45 = 0.0<_UsePCF;
            if(u_xlatb45){
                u_xlat45 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat6.x = float(u_xlati_loop_1);
                    u_xlat33 = u_xlat45;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat6.y = float(u_xlati_loop_2);
                        u_xlat20.xy = u_xlat6.xy * _CustomShadowTex_TexelSize.xy + u_xlat5.xy;
                        u_xlat10_20 = texture2DLodEXT(_CustomShadowTex, u_xlat20.xy, 0.0).x;
                        u_xlat20.x = (-u_xlat10_20) + 1.0;
                        u_xlatb20 = u_xlat44<u_xlat20.x;
                        u_xlat20.x = (u_xlatb20) ? _CustomShadowStrength : 1.0;
                        u_xlat33 = u_xlat33 + u_xlat20.x;
                    }
                    u_xlat45 = u_xlat33;
                }
                u_xlat31 = u_xlat45 * 0.111111112;
            } else {
                u_xlat10_45 = texture2DLodEXT(_CustomShadowTex, u_xlat5.xy, 0.0).x;
                u_xlat45 = (-u_xlat10_45) + 1.0;
                u_xlatb44 = u_xlat44<u_xlat45;
                u_xlat31 = (u_xlatb44) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat5.xyz = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xyz = u_xlat5.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat1.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat5.xyz = u_xlat5.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat1.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat44 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat45 = (-_LightShadowData.x) + 1.0;
        u_xlat31 = u_xlat44 * u_xlat45 + _LightShadowData.x;
    }
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat5.xyz = (-u_xlat5.xyz) + vs_TEXCOORD2.xyz;
    u_xlat44 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat44 = sqrt(u_xlat44);
    u_xlat45 = _Delta_ShadowCenter.w + 1.0;
    u_xlat16.z = u_xlat44 * u_xlat45;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat16.xyz;
    u_xlat44 = u_xlat16.z * u_xlat16.z;
    u_xlat44 = min(u_xlat44, 1.0);
    u_xlat31 = (-u_xlat31) + 1.0;
    u_xlat31 = (-u_xlat31) * _ShadowIntensity + 1.0;
    u_xlat45 = (-u_xlat44) + 1.0;
    u_xlat44 = u_xlat31 * u_xlat45 + u_xlat44;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat31 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat31) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat31 = (-u_xlat3.x) + 1.0;
    u_xlat5.xyz = u_xlat4.xyz * vec3(u_xlat31);
    u_xlat16.x = max(u_xlat16.x, 0.100000001);
    u_xlat45 = u_xlat3.y * u_xlat3.y;
    u_xlat46 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat16.x = u_xlat16.x * u_xlat46;
    u_xlat45 = u_xlat45 * u_xlat3.y;
    u_xlat30 = u_xlat16.y * u_xlat45 + (-u_xlat16.y);
    u_xlat30 = u_xlat30 + 1.0;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat16.x = u_xlat16.x * u_xlat30;
    u_xlat16.x = u_xlat45 / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.25 + -9.99999975e-06;
    u_xlat16.x = max(u_xlat16.x, 0.0);
    u_xlat16.x = min(u_xlat16.x, 20.0);
    u_xlat6.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat6.xyz = u_xlat3.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat7.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat8.xyz = vec3(u_xlat31) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat8.xyz;
    u_xlat16.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat16.x = u_xlat16.x + u_xlat16.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat16.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat16.x = u_xlat3.y * 8.0;
    u_xlat10_8 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat16.x);
    u_xlat9.xyz = u_xlat10_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xyz = u_xlat10_8.xyz * u_xlat9.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat10_8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = u_xlat10_8.www * u_xlat8.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat16.x = u_xlat16.x + 1.0;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat42 = (-u_xlat42) + 1.0;
    u_xlat30 = u_xlat42 * u_xlat42;
    u_xlat30 = u_xlat30 * u_xlat30;
    u_xlat3.xzw = (-u_xlat6.xyz) + u_xlat16.xxx;
    u_xlat16.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = u_xlat16.xxx * u_xlat6.xyz;
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xzw + u_xlat6.xyz;
    u_xlat6 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat6 = (bool(u_xlatb16)) ? u_xlat6 : u_xlat6.zwxy;
    u_xlat6.xy = u_xlat6.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_UVMap, u_xlat6.xy).xyz;
    u_xlat8.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat8.xyz = u_xlat8.xyz * _LG_Color.xyz;
    u_xlat6.xy = u_xlat6.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_LG_Tex, u_xlat6.xy).xyz;
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat6.xyz = u_xlat6.xyz * _LG2_Color.xyz;
    u_xlat10_9.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat30 = u_xlat10_9.z + u_xlat10_9.y;
    u_xlat30 = u_xlat30 * 0.5;
    u_xlat30 = u_xlat30 / _LG2_MaskSlider;
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
    u_xlat13.xyz = (bool(u_xlatb16)) ? u_xlat8.xyz : u_xlat6.xyz;
    u_xlat8.xyz = (bool(u_xlatb16)) ? u_xlat6.xyz : u_xlat8.xyz;
    u_xlat6.xyz = u_xlat13.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat6.xyz;
    u_xlat6.xyz = u_xlat10_9.xxx * u_xlat8.xyz + u_xlat6.xyz;
    u_xlatb16 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat16.xy = (bool(u_xlatb16)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb8.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16.x = (u_xlatb8.x) ? u_xlat16.x : 1.0;
    u_xlat16.x = (u_xlatb8.y) ? u_xlat16.y : u_xlat16.x;
    u_xlat16.x = u_xlat16.x + _ClipAmount;
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Fanwei);
    u_xlat16.xy = u_xlat16.xx + vec2(1.0, 0.5);
    u_xlat16.x = dot(u_xlat16.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat16.x = u_xlat16.x + (-_Rongjie_Color_Fanwei);
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlatb30 = u_xlat16.y<0.0;
    if(u_xlatb30){discard;}
    u_xlat8.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat8.xyz = u_xlat8.xyz * vec3(_DissolveColor_Power);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat42 = log2(u_xlat42);
    u_xlat30 = u_xlat42 * _Fres_Power;
    u_xlat30 = exp2(u_xlat30);
    u_xlat30 = max(u_xlat30, 0.00999999978);
    u_xlat30 = u_xlat30 * _Fres_Sacle;
    u_xlat42 = u_xlat42 * _Fres_Power2;
    u_xlat42 = exp2(u_xlat42);
    u_xlat42 = max(u_xlat42, 0.00999999978);
    u_xlat42 = u_xlat42 * _Fres_Sacle2;
    u_xlat9.xyz = vec3(u_xlat42) * _FresColor2.xyz;
    u_xlat10.xyz = vec3(u_xlat30) * _FresColor.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = vec3(_ChangeMainTex) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat10_10 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat11.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat11.xyz = u_xlat10_10.xyz * u_xlat11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_10.xyz * u_xlat11.xyz;
    u_xlat42 = max(_Em_Intensity, 0.0);
    u_xlat10.xyz = u_xlat10.xyz * vec3(u_xlat42);
    u_xlat42 = _Time.y * _Em_Speed;
    u_xlat42 = sin(u_xlat42);
    u_xlat10.xyz = (-u_xlat10.xyz) * abs(vec3(u_xlat42)) + u_xlat10.xyz;
    u_xlat7.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat42 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat42 = u_xlat42 * _AdditionalRefAlpha;
    u_xlat42 = u_xlat1.w * _Alpha + u_xlat42;
    u_xlat3.w = min(u_xlat42, 1.0);
    u_xlat5.xyz = u_xlat5.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat8.xyz * u_xlat16.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat9.xyz * u_xlat10_10.www + u_xlat10.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat44) + u_xlat2.xyz;
    u_xlat16_12.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_12.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat0.y<0.0);
#else
    u_xlatb11 = u_xlat0.y<0.0;
#endif
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat16_11.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat16_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat36);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat16_7 = textureLod(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat16_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_3.xyz = texture(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat16_5.xyz = texture(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat16_13.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat16_13.z + u_xlat16_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat16_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_3 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat0.y<0.0);
#else
    u_xlatb11 = u_xlat0.y<0.0;
#endif
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat16_11.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat16_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat36);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat16_7 = textureLod(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat16_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_3.xyz = texture(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat16_5.xyz = texture(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat16_13.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat16_13.z + u_xlat16_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat16_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_3 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
bool u_xlatb11;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
    u_xlatb11 = u_xlat0.y<0.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat10_11.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat10_3.xyz = texture2D(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat10_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(u_xlat36);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat10_7 = textureCubeLodEXT(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat10_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat10_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_3.xyz = texture2D(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat10_5.xyz = texture2D(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat10_13.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat10_13.z + u_xlat10_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat10_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat10_3 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
bool u_xlatb11;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
    u_xlatb11 = u_xlat0.y<0.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat10_11.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat10_3.xyz = texture2D(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat10_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(u_xlat36);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat10_7 = textureCubeLodEXT(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat10_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat10_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_3.xyz = texture2D(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat10_5.xyz = texture2D(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat10_13.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat10_13.z + u_xlat10_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat10_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat10_3 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
mediump float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_softShadowQuality==1.0);
#else
    u_xlatb80 = _softShadowQuality==1.0;
#endif
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb80 = !!(_softShadowQuality==2.0);
#else
        u_xlatb80 = _softShadowQuality==2.0;
#endif
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat16_5 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_20.xyz = texture(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat16_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_22.xyz = texture(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat16_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat16_23.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat16_23.z + u_xlat16_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat28.y<0.0);
#else
    u_xlatb54 = u_xlat28.y<0.0;
#endif
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat16_5 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat16_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
mediump float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_softShadowQuality==1.0);
#else
    u_xlatb80 = _softShadowQuality==1.0;
#endif
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb80 = !!(_softShadowQuality==2.0);
#else
        u_xlatb80 = _softShadowQuality==2.0;
#endif
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat16_5 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_20.xyz = texture(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat16_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_22.xyz = texture(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat16_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat16_23.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat16_23.z + u_xlat16_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat28.y<0.0);
#else
    u_xlatb54 = u_xlat28.y<0.0;
#endif
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat16_5 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat16_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
vec3 u_xlat22;
lowp vec3 u_xlat10_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
lowp vec3 u_xlat10_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
lowp float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
lowp float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat80);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb80 = _ShadowBias.z!=0.0;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlatb80 = _softShadowQuality==1.0;
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb80 = _softShadowQuality==2.0;
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat10_5 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat10_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_20.xyz = texture2D(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat10_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_22.xyz = texture2D(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat10_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat10_23.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat10_23.z + u_xlat10_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
    u_xlatb54 = u_xlat28.y<0.0;
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat10_5 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat10_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
vec3 u_xlat22;
lowp vec3 u_xlat10_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
lowp vec3 u_xlat10_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
lowp float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
lowp float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat80);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb80 = _ShadowBias.z!=0.0;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlatb80 = _softShadowQuality==1.0;
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb80 = _softShadowQuality==2.0;
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat10_5 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat10_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_20.xyz = texture2D(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat10_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_22.xyz = texture2D(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat10_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat10_23.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat10_23.z + u_xlat10_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
    u_xlatb54 = u_xlat28.y<0.0;
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat10_5 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat10_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat0.y<0.0);
#else
    u_xlatb11 = u_xlat0.y<0.0;
#endif
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat16_11.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat16_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat36);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat16_7 = textureLod(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat16_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_3.xyz = texture(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat16_5.xyz = texture(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat16_13.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat16_13.z + u_xlat16_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat16_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_3 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
bool u_xlatb11;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat0.y<0.0);
#else
    u_xlatb11 = u_xlat0.y<0.0;
#endif
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat16_11.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat16_3.xyz = texture(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat16_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(u_xlat36);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat16_7 = textureLod(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat16_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat16_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_3.xyz = texture(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat16_5.xyz = texture(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat16_13.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat16_13.z + u_xlat16_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat16_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat16_3 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
bool u_xlatb11;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
    u_xlatb11 = u_xlat0.y<0.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat10_11.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat10_3.xyz = texture2D(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat10_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(u_xlat36);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat10_7 = textureCubeLodEXT(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat10_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat10_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_3.xyz = texture2D(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat10_5.xyz = texture2D(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat10_13.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat10_13.z + u_xlat10_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat10_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat10_3 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
lowp vec3 u_xlat10_11;
bool u_xlatb11;
vec3 u_xlat13;
lowp vec3 u_xlat10_13;
bool u_xlatb13;
float u_xlat22;
bvec2 u_xlatb22;
vec2 u_xlat24;
float u_xlat33;
mediump float u_xlat16_34;
float u_xlat35;
float u_xlat36;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 1.0)).xy;
    u_xlat0.x = (u_xlatb22.x) ? u_xlat0.x : 1.0;
    u_xlat0.x = (u_xlatb22.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _ClipAmount;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Fanwei);
    u_xlat0.xy = u_xlat0.xx + vec2(1.0, 0.5);
    u_xlatb11 = u_xlat0.y<0.0;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat0.x = u_xlat0.x + (-_Rongjie_Color_Fanwei);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    if(u_xlatb11){discard;}
    u_xlat10_11.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat11.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat11.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat11.xyz;
    u_xlat2.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat11.xyz = u_xlat11.xyz * u_xlat2.xxx;
    u_xlat2.x = dot(u_xlat11.xyz, vs_TEXCOORD7.xyz);
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat13.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_34 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_1.xyz = vec3(u_xlat16_34) * u_xlat16_1.xyz;
    u_xlat24.x = dot(u_xlat11.xyz, u_xlat16_1.xyz);
    u_xlat24.y = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat13.yz = max(u_xlat24.xy, vec2(0.0, 0.0));
    u_xlat13.xz = u_xlat13.xz * u_xlat13.xz;
    u_xlat35 = max(u_xlat13.z, 0.100000001);
    u_xlat3.xy = u_xlat13.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat24.x = u_xlat13.y * u_xlat13.y;
    u_xlat10_3.xyz = texture2D(_LaserRamp, u_xlat3.xy).xyz;
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat36 = u_xlat10_4.z * _LaserRamp_Intensity;
    u_xlat4.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(u_xlat36);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat36 = dot(u_xlat3.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat3.xyz;
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat36 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat36 = u_xlat36 + 1.0;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(u_xlat36);
    u_xlat36 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat7.xyz = vec3(u_xlat36) * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat13.xxx * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat13.x = dot((-vs_TEXCOORD7.xyz), u_xlat11.xyz);
    u_xlat13.x = u_xlat13.x + u_xlat13.x;
    u_xlat7.xyz = u_xlat11.xyz * (-u_xlat13.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat11.x = dot(u_xlat11.xyz, vs_TEXCOORD6.xyz);
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
    u_xlat22 = u_xlat7.y * 0.200000003 + 0.800000012;
    u_xlat33 = u_xlat4.y * 8.0;
    u_xlat10_7 = textureCubeLodEXT(_Cubemap, u_xlat7.xyz, u_xlat33);
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat10_7.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat10_7.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat10_7.www * u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat22) * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat7.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_Intensity);
    u_xlat22 = u_xlat4.y * u_xlat4.y;
    u_xlat22 = u_xlat22 * u_xlat4.y;
    u_xlat33 = u_xlat24.x * u_xlat22 + (-u_xlat24.x);
    u_xlat33 = u_xlat33 + 1.0;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat13.x = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat24.x = (-u_xlat4.x) + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat13.x;
    u_xlat22 = u_xlat22 / u_xlat33;
    u_xlat22 = u_xlat22 * 0.25 + -9.99999975e-06;
    u_xlat22 = max(u_xlat22, 0.0);
    u_xlat22 = min(u_xlat22, 20.0);
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat11.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat24.xxx * _Ambient_Color.xyz;
    u_xlat13.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat13.xyz * _DirectionalLight_Color.xyz;
    u_xlat11.xyz = u_xlat13.xyz * u_xlat11.xxx + u_xlat3.xyz;
    u_xlat3 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb13 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat3 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat3.zwxy;
    u_xlat24.xy = u_xlat3.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat3.xy = u_xlat3.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_3.xyz = texture2D(_LG_Tex, u_xlat3.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat3.xyz = u_xlat3.xyz * _LG2_Color.xyz;
    u_xlat10_5.xyz = texture2D(_LG_UVMap, u_xlat24.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_LG_Intensity);
    u_xlat5.xyz = u_xlat5.xyz * _LG_Color.xyz;
    u_xlat10.xyz = (bool(u_xlatb13)) ? u_xlat5.xyz : u_xlat3.xyz;
    u_xlat5.xyz = (bool(u_xlatb13)) ? u_xlat3.xyz : u_xlat5.xyz;
    u_xlat3.xyz = u_xlat10.xyz;
    u_xlat10_13.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat24.x = u_xlat10_13.z + u_xlat10_13.y;
    u_xlat24.x = u_xlat24.x * 0.5;
    u_xlat24.x = u_xlat24.x / _LG2_MaskSlider;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat24.xxx;
    u_xlat13.xyz = u_xlat10_13.xxx * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat11.xyz = u_xlat11.xyz + u_xlat13.xyz;
    u_xlat13.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(_DissolveColor_Power);
    u_xlat0.xyz = u_xlat13.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat0.xyz = u_xlat1.www * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat4.xyz;
    u_xlat33 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat33 = u_xlat33 * _AdditionalRefAlpha;
    u_xlat33 = u_xlat1.w * _Alpha + u_xlat33;
    u_xlat1.w = min(u_xlat33, 1.0);
    u_xlat33 = u_xlat2.x * _Fres_Power;
    u_xlat2.x = u_xlat2.x * _Fres_Power2;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat2.x = u_xlat2.x * _Fres_Sacle2;
    u_xlat2.xyz = u_xlat2.xxx * _FresColor2.xyz;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = max(u_xlat33, 0.00999999978);
    u_xlat33 = u_xlat33 * _Fres_Sacle;
    u_xlat3.xyz = vec3(u_xlat33) * _FresColor.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(_ChangeMainTex) * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat10_3 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.xyz;
    u_xlat33 = max(_Em_Intensity, 0.0);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat33);
    u_xlat33 = _Time.y * _Em_Speed;
    u_xlat33 = sin(u_xlat33);
    u_xlat3.xyz = (-u_xlat3.xyz) * abs(vec3(u_xlat33)) + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_3.www + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
mediump float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_softShadowQuality==1.0);
#else
    u_xlatb80 = _softShadowQuality==1.0;
#endif
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb80 = !!(_softShadowQuality==2.0);
#else
        u_xlatb80 = _softShadowQuality==2.0;
#endif
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat16_5 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_20.xyz = texture(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat16_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_22.xyz = texture(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat16_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat16_23.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat16_23.z + u_xlat16_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat28.y<0.0);
#else
    u_xlatb54 = u_xlat28.y<0.0;
#endif
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat16_5 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat16_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _LaserRamp;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _LG_Mask;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
UNITY_LOCATION(9) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(10) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
mediump vec3 u_xlat16_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
mediump float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
mediump float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat16_0.xyz = texture(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat16_3.xyz = texture(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat16_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xy = min(max(u_xlat3.xy, 0.0), 1.0);
#else
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
#endif
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat16_4.xyz = texture(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat16_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(u_xlat80);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb80 = _ShadowBias.z!=0.0;
#endif
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat80 = min(max(u_xlat80, 0.0), 1.0);
#else
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
#endif
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb80 = !!(_softShadowQuality==1.0);
#else
    u_xlatb80 = _softShadowQuality==1.0;
#endif
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb80 = !!(_softShadowQuality==2.0);
#else
        u_xlatb80 = _softShadowQuality==2.0;
#endif
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat16_5 = textureLod(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat16_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat16_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
#endif
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat16_20.xyz = texture(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat16_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_22.xyz = texture(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat16_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat16_23.xyz = texture(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat16_23.z + u_xlat16_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb28 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U));
#else
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
#endif
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
#ifdef UNITY_ADRENO_ES3
    u_xlat28.x = min(max(u_xlat28.x, 0.0), 1.0);
#else
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(u_xlat28.y<0.0);
#else
    u_xlatb54 = u_xlat28.y<0.0;
#endif
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat16_5 = texture(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat16_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat16_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
vec3 u_xlat22;
lowp vec3 u_xlat10_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
lowp vec3 u_xlat10_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
lowp float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
lowp float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat80);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb80 = _ShadowBias.z!=0.0;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlatb80 = _softShadowQuality==1.0;
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb80 = _softShadowQuality==2.0;
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat10_5 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat10_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_20.xyz = texture2D(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat10_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_22.xyz = texture2D(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat10_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat10_23.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat10_23.z + u_xlat10_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
    u_xlatb54 = u_xlat28.y<0.0;
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat10_5 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat10_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
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
    vs_TEXCOORD0.zw = in_TEXCOORD2.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif
#ifdef GL_EXT_shadow_samplers
#extension GL_EXT_shadow_samplers : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainColor2;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _LaserRamp_ST;
uniform 	float _LaserRamp_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Exchange_LGTex;
uniform 	vec4 _LG_UVMap_ST;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG2_Color;
uniform 	float _LG_Intensity;
uniform 	float _LG2_Intensity;
uniform 	float _LG2_MaskSlider;
uniform 	vec4 _LG_Speed;
uniform 	float _ChangeMainTex;
uniform 	float _Dissolve_Dir;
uniform 	float _Dissovle_Use_3U;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColor_Power;
uniform 	float _ClipAmount;
uniform 	float _Rongjie_Fanwei;
uniform 	float _Rongjie_Color_Fanwei;
uniform 	float _Fres_Sacle;
uniform 	float _Fres_Power;
uniform 	vec4 _FresColor;
uniform 	float _Fres_Sacle2;
uniform 	float _Fres_Power2;
uniform 	vec4 _FresColor2;
uniform 	vec4 _Delta_ShadowCenter;
uniform 	float _ShadowIntensity;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _LaserRamp;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Mask;
uniform lowp sampler2D _EmissionTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec4 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec2 u_xlat16_16;
mediump vec2 u_xlat16_17;
mediump vec4 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
vec3 u_xlat22;
lowp vec3 u_xlat10_22;
bvec2 u_xlatb22;
vec3 u_xlat23;
lowp vec3 u_xlat10_23;
vec3 u_xlat24;
vec3 u_xlat25;
vec3 u_xlat28;
bool u_xlatb28;
mediump float u_xlat16_35;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
lowp float u_xlat10_55;
mediump vec2 u_xlat16_61;
mediump vec2 u_xlat16_62;
mediump vec2 u_xlat16_63;
mediump vec2 u_xlat16_64;
mediump vec2 u_xlat16_68;
float u_xlat78;
mediump float u_xlat16_79;
float u_xlat80;
lowp float u_xlat10_80;
bool u_xlatb80;
float u_xlat81;
float u_xlat82;
mediump float u_xlat16_87;
void main()
{
    u_xlat10_0.xyz = texture2D(_Normal, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD5.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat78 = inversesqrt(u_xlat78);
    u_xlat0.xyz = vec3(u_xlat78) * u_xlat0.xyz;
    u_xlat16_1.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_79 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_1.xyz = vec3(u_xlat16_79) * u_xlat16_1.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vs_TEXCOORD7.xyz);
    u_xlat78 = max(u_xlat78, 0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vs_TEXCOORD6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat28.x = dot(u_xlat16_1.xyz, vs_TEXCOORD6.xyz);
    u_xlat28.y = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat28.xy = max(u_xlat28.xy, vec2(0.0, 0.0));
    u_xlat10_3.xyz = texture2D(_Metal_Rough_Skin, vs_TEXCOORD0.xy).xyz;
    u_xlat3.xy = u_xlat10_3.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat4.xy = u_xlat28.yy * _LaserRamp_ST.xy + _LaserRamp_ST.zw;
    u_xlat10_4.xyz = texture2D(_LaserRamp, u_xlat4.xy).xyz;
    u_xlat80 = u_xlat10_3.z * _LaserRamp_Intensity;
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat80);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlatb80 = _ShadowBias.z!=0.0;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat5.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat55 = dot(vs_TEXCOORD3.xyz, u_xlat5.xyz);
    u_xlat55 = (-u_xlat55) * u_xlat55 + 1.0;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * _ShadowBias.z;
    u_xlat5.xyz = (-vs_TEXCOORD3.xyz) * vec3(u_xlat55) + vs_TEXCOORD2.xyz;
    u_xlat5.xyz = (bool(u_xlatb80)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat1;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat6;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat7;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat8;
    u_xlat6 = u_xlat5.yyyy * u_xlat6;
    u_xlat1 = u_xlat1 * u_xlat5.xxxx + u_xlat6;
    u_xlat1 = u_xlat7 * u_xlat5.zzzz + u_xlat1;
    u_xlat1 = u_xlat8 + u_xlat1;
    u_xlat80 = _ShadowBias.x / u_xlat1.w;
    u_xlat80 = clamp(u_xlat80, 0.0, 1.0);
    u_xlat80 = u_xlat1.z + (-u_xlat80);
    u_xlat55 = max((-u_xlat1.w), u_xlat80);
    u_xlat55 = (-u_xlat80) + u_xlat55;
    u_xlat1.z = _ShadowBias.y * u_xlat55 + u_xlat80;
    u_xlat5.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat1.xyz = u_xlat5.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.w = max(u_xlat1.z, 9.99999975e-05);
    u_xlat16_9.x = (-_ShadowBias.w) + 1.0;
    u_xlatb80 = _softShadowQuality==1.0;
    if(u_xlatb80){
        u_xlat5.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat5.z = 0.0;
        u_xlat5.xyz = u_xlat1.xyw + u_xlat5.xyz;
        vec3 txVec0 = vec3(u_xlat5.xy,u_xlat5.z);
        u_xlat5.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec1 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec2 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat6.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat6.z = 0.0;
        u_xlat6.xyz = u_xlat1.xyw + u_xlat6.xyz;
        vec3 txVec3 = vec3(u_xlat6.xy,u_xlat6.z);
        u_xlat5.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_35 = dot(u_xlat5, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb80 = _softShadowQuality==2.0;
        if(u_xlatb80){
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_62.xy = u_xlat16_6.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_11.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_63.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_12.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_12.xy = (-u_xlat16_12.xy) * u_xlat16_12.xy + u_xlat16_63.xy;
            u_xlat16_10.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_5.yw;
            u_xlat16_12.xy = u_xlat16_12.xy + vec2(1.0, 1.0);
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_6.xy = u_xlat16_11.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_63.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_12.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_11.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_10.xy = u_xlat16_5.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_6.z = u_xlat16_8.x;
            u_xlat16_6.w = u_xlat16_10.x;
            u_xlat16_7.z = u_xlat16_11.x;
            u_xlat16_7.w = u_xlat16_62.x;
            u_xlat16_5 = u_xlat16_6.zwxz + u_xlat16_7.zwxz;
            u_xlat16_8.z = u_xlat16_6.y;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_11.z = u_xlat16_7.y;
            u_xlat16_11.w = u_xlat16_62.y;
            u_xlat16_10.xyz = u_xlat16_8.zyw + u_xlat16_11.zyw;
            u_xlat16_12.xyz = u_xlat16_7.xzw / u_xlat16_5.zwy;
            u_xlat16_12.xyz = u_xlat16_12.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_11.xyz = u_xlat16_11.zyw / u_xlat16_10.xyz;
            u_xlat16_11.xyz = u_xlat16_11.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_6.xyz = u_xlat16_12.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_7.xyz = u_xlat16_11.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_6.w = u_xlat16_7.x;
            u_xlat16_8 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.ywxw;
            u_xlat16_11.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.zw;
            u_xlat16_7.w = u_xlat16_6.y;
            u_xlat16_6.yw = u_xlat16_7.yz;
            u_xlat16_12 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyzy;
            u_xlat16_7 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.wywz;
            u_xlat16_6 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xwzw;
            u_xlat16_13 = u_xlat16_5.zwyz * u_xlat16_10.xxxy;
            u_xlat16_14 = u_xlat16_5 * u_xlat16_10.yyzz;
            u_xlat16_61.x = u_xlat16_5.y * u_xlat16_10.z;
            vec3 txVec4 = vec3(u_xlat16_8.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_8.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_87 = u_xlat10_55 * u_xlat16_13.y;
            u_xlat16_87 = u_xlat16_13.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec6 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_87 = u_xlat16_13.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec7 = vec3(u_xlat16_7.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_87 = u_xlat16_13.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec8 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_87 = u_xlat16_14.x * u_xlat10_80 + u_xlat16_87;
            vec3 txVec9 = vec3(u_xlat16_12.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_87 = u_xlat16_14.y * u_xlat10_80 + u_xlat16_87;
            vec3 txVec10 = vec3(u_xlat16_7.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_87 = u_xlat16_14.z * u_xlat10_80 + u_xlat16_87;
            vec3 txVec11 = vec3(u_xlat16_6.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_87 = u_xlat16_14.w * u_xlat10_80 + u_xlat16_87;
            vec3 txVec12 = vec3(u_xlat16_6.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_35 = u_xlat16_61.x * u_xlat10_80 + u_xlat16_87;
        } else {
            u_xlat16_61.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_61.xy = floor(u_xlat16_61.xy);
            u_xlat16_10.xy = u_xlat1.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_61.xy);
            u_xlat16_5 = u_xlat16_10.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_6 = u_xlat16_5.xxzz * u_xlat16_5.xxzz;
            u_xlat16_7.yw = u_xlat16_6.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_62.xy = u_xlat16_6.xz * vec2(0.5, 0.5) + (-u_xlat16_10.xy);
            u_xlat16_11.xy = (-u_xlat16_10.xy) + vec2(1.0, 1.0);
            u_xlat16_63.xy = min(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.xy = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_11.xy;
            u_xlat16_63.xy = max(u_xlat16_10.xy, vec2(0.0, 0.0));
            u_xlat16_11.zw = (-u_xlat16_63.xy) * u_xlat16_63.xy + u_xlat16_5.yw;
            u_xlat16_11 = u_xlat16_11 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_5.z = u_xlat16_11.z * 0.0816320032;
            u_xlat16_6.xy = u_xlat16_62.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_62.xy = u_xlat16_11.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_6.z = u_xlat16_11.w * 0.0816320032;
            u_xlat16_5.x = u_xlat16_6.y;
            u_xlat16_5.yw = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_8.xz = u_xlat16_10.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_8.y = u_xlat16_62.x;
            u_xlat16_8.w = u_xlat16_7.y;
            u_xlat16_5 = u_xlat16_5 + u_xlat16_8;
            u_xlat16_6.yw = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_7.xz = u_xlat16_10.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_7.y = u_xlat16_62.y;
            u_xlat16_6 = u_xlat16_6 + u_xlat16_7;
            u_xlat16_8 = u_xlat16_8 / u_xlat16_5;
            u_xlat16_8 = u_xlat16_8 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_7 = u_xlat16_7 / u_xlat16_6;
            u_xlat16_7 = u_xlat16_7 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_8 = u_xlat16_8.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_7 = u_xlat16_7.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_10.xzw = u_xlat16_8.yzw;
            u_xlat16_10.y = u_xlat16_7.x;
            u_xlat16_11 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_12.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.y = u_xlat16_10.y;
            u_xlat16_10.y = u_xlat16_7.z;
            u_xlat16_13 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_64.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.z = u_xlat16_10.y;
            u_xlat16_14 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyxz;
            u_xlat16_10.y = u_xlat16_7.w;
            u_xlat16_15 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_10.xyzy;
            u_xlat16_16.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_10.wy;
            u_xlat16_8.w = u_xlat16_10.y;
            u_xlat16_68.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.xw;
            u_xlat16_7.xzw = u_xlat16_10.xzw;
            u_xlat16_10 = u_xlat16_61.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_17.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_7.x = u_xlat16_8.x;
            u_xlat16_61.xy = u_xlat16_61.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.xy;
            u_xlat16_7 = u_xlat16_5 * u_xlat16_6.xxxx;
            u_xlat16_8 = u_xlat16_5 * u_xlat16_6.yyyy;
            u_xlat16_18 = u_xlat16_5 * u_xlat16_6.zzzz;
            u_xlat16_5 = u_xlat16_5 * u_xlat16_6.wwww;
            vec3 txVec13 = vec3(u_xlat16_11.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_11.zw,u_xlat1.w);
            u_xlat10_55 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_11.x = u_xlat10_55 * u_xlat16_7.y;
            u_xlat16_11.x = u_xlat16_7.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec15 = vec3(u_xlat16_12.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_11.x = u_xlat16_7.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec16 = vec3(u_xlat16_14.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_11.x = u_xlat16_7.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec17 = vec3(u_xlat16_13.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_11.x = u_xlat16_8.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec18 = vec3(u_xlat16_13.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_11.x = u_xlat16_8.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec19 = vec3(u_xlat16_64.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_11.x = u_xlat16_8.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec20 = vec3(u_xlat16_14.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_11.x = u_xlat16_8.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec21 = vec3(u_xlat16_15.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_11.x = u_xlat16_18.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec22 = vec3(u_xlat16_15.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_11.x = u_xlat16_18.y * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec23 = vec3(u_xlat16_16.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_11.x = u_xlat16_18.z * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec24 = vec3(u_xlat16_68.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_11.x = u_xlat16_18.w * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec25 = vec3(u_xlat16_10.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_10.x = u_xlat16_5.x * u_xlat10_80 + u_xlat16_11.x;
            vec3 txVec26 = vec3(u_xlat16_10.zw,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_10.x = u_xlat16_5.y * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec27 = vec3(u_xlat16_17.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_10.x = u_xlat16_5.z * u_xlat10_80 + u_xlat16_10.x;
            vec3 txVec28 = vec3(u_xlat16_61.xy,u_xlat1.w);
            u_xlat10_80 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_35 = u_xlat16_5.w * u_xlat10_80 + u_xlat16_10.x;
        }
    }
    u_xlat16_61.x = (-u_xlat16_9.x) + 1.0;
    u_xlat16_9.x = u_xlat16_35 * u_xlat16_61.x + u_xlat16_9.x;
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz + _Delta_ShadowCenter.xyz;
    u_xlat19.xyz = (-u_xlat19.xyz) + vs_TEXCOORD2.xyz;
    u_xlat80 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat80 = sqrt(u_xlat80);
    u_xlat55 = _Delta_ShadowCenter.w + 1.0;
    u_xlat28.z = u_xlat80 * u_xlat55;
    u_xlat28.xyz = u_xlat28.xyz * u_xlat28.xyz;
    u_xlat80 = u_xlat28.z * u_xlat28.z;
    u_xlat80 = min(u_xlat80, 1.0);
    u_xlat55 = (-u_xlat16_9.x) + 1.0;
    u_xlat55 = (-u_xlat55) * _ShadowIntensity + 1.0;
    u_xlat81 = (-u_xlat80) + 1.0;
    u_xlat80 = u_xlat55 * u_xlat81 + u_xlat80;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat5 = (-u_xlat1) + _MainColor2;
    u_xlat1 = vec4(_ChangeMainTex) * u_xlat5 + u_xlat1;
    u_xlat55 = dot(u_xlat4.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat4.xyz = (-u_xlat1.xyz) + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat55) * u_xlat4.xyz + u_xlat1.xyz;
    u_xlat55 = (-u_xlat3.x) + 1.0;
    u_xlat19.xyz = u_xlat4.xyz * vec3(u_xlat55);
    u_xlat28.x = max(u_xlat28.x, 0.100000001);
    u_xlat81 = u_xlat3.y * u_xlat3.y;
    u_xlat82 = u_xlat3.y * u_xlat3.y + 0.5;
    u_xlat28.x = u_xlat28.x * u_xlat82;
    u_xlat81 = u_xlat81 * u_xlat3.y;
    u_xlat54 = u_xlat28.y * u_xlat81 + (-u_xlat28.y);
    u_xlat54 = u_xlat54 + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat28.x = u_xlat28.x * u_xlat54;
    u_xlat28.x = u_xlat81 / u_xlat28.x;
    u_xlat28.x = u_xlat28.x * 0.25 + -9.99999975e-06;
    u_xlat28.x = max(u_xlat28.x, 0.0);
    u_xlat28.x = min(u_xlat28.x, 20.0);
    u_xlat20.xyz = u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat20.xyz = u_xlat3.xxx * u_xlat20.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat22.xyz = vec3(u_xlat55) * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat22.xyz;
    u_xlat28.x = dot((-vs_TEXCOORD7.xyz), u_xlat0.xyz);
    u_xlat28.x = u_xlat28.x + u_xlat28.x;
    u_xlat0.xyz = u_xlat0.xyz * (-u_xlat28.xxx) + (-vs_TEXCOORD7.xyz);
    u_xlat28.x = u_xlat3.y * 8.0;
    u_xlat10_5 = textureCubeLodEXT(_Cubemap, u_xlat0.xyz, u_xlat28.x);
    u_xlat22.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat22.xyz = u_xlat10_5.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat10_5.www * u_xlat22.xyz;
    u_xlat0.x = u_xlat0.y * 0.200000003 + 0.800000012;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat22.xyz;
    u_xlat28.x = (-u_xlat3.y) + u_xlat3.x;
    u_xlat28.x = u_xlat28.x + 1.0;
    u_xlat28.x = min(u_xlat28.x, 1.0);
    u_xlat78 = (-u_xlat78) + 1.0;
    u_xlat54 = u_xlat78 * u_xlat78;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat3.xzw = (-u_xlat20.xyz) + u_xlat28.xxx;
    u_xlat28.x = (-u_xlat3.y) * 0.980000019 + 1.0;
    u_xlat20.xyz = u_xlat28.xxx * u_xlat20.xyz;
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xzw + u_xlat20.xyz;
    u_xlat5 = _Time.yyyy * _LG_Speed.zwxy + vs_TEXCOORD1.xyxy;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Exchange_LGTex);
    u_xlat5 = (bool(u_xlatb28)) ? u_xlat5 : u_xlat5.zwxy;
    u_xlat20.xy = u_xlat5.xy * _LG_UVMap_ST.xy + _LG_UVMap_ST.zw;
    u_xlat10_20.xyz = texture2D(_LG_UVMap, u_xlat20.xy).xyz;
    u_xlat20.xyz = u_xlat10_20.xyz * vec3(_LG_Intensity);
    u_xlat20.xyz = u_xlat20.xyz * _LG_Color.xyz;
    u_xlat22.xy = u_xlat5.zw * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_22.xyz = texture2D(_LG_Tex, u_xlat22.xy).xyz;
    u_xlat22.xyz = u_xlat10_22.xyz * vec3(vec3(_LG2_Intensity, _LG2_Intensity, _LG2_Intensity));
    u_xlat22.xyz = u_xlat22.xyz * _LG2_Color.xyz;
    u_xlat10_23.xyz = texture2D(_LG_Mask, vs_TEXCOORD1.xy).xyz;
    u_xlat54 = u_xlat10_23.z + u_xlat10_23.y;
    u_xlat54 = u_xlat54 * 0.5;
    u_xlat54 = u_xlat54 / _LG2_MaskSlider;
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
    u_xlat25.xyz = (bool(u_xlatb28)) ? u_xlat20.xyz : u_xlat22.xyz;
    u_xlat22.xyz = (bool(u_xlatb28)) ? u_xlat22.xyz : u_xlat20.xyz;
    u_xlat20.xyz = u_xlat25.xyz;
    u_xlat20.xyz = vec3(u_xlat54) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10_23.xxx * u_xlat22.xyz + u_xlat20.xyz;
    u_xlatb28 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissovle_Use_3U);
    u_xlat28.xy = (bool(u_xlatb28)) ? vs_TEXCOORD0.zw : vs_TEXCOORD0.xy;
    u_xlatb22.xy = equal(vec4(vec4(_Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir, _Dissolve_Dir)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat28.x = (u_xlatb22.x) ? u_xlat28.x : 1.0;
    u_xlat28.x = (u_xlatb22.y) ? u_xlat28.y : u_xlat28.x;
    u_xlat28.x = u_xlat28.x + _ClipAmount;
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Fanwei, _Rongjie_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Fanwei);
    u_xlat28.xy = u_xlat28.xx + vec2(1.0, 0.5);
    u_xlat28.x = dot(u_xlat28.xx, vec2(vec2(_Rongjie_Color_Fanwei, _Rongjie_Color_Fanwei)));
    u_xlat28.x = u_xlat28.x + (-_Rongjie_Color_Fanwei);
    u_xlat28.x = clamp(u_xlat28.x, 0.0, 1.0);
    u_xlatb54 = u_xlat28.y<0.0;
    if(u_xlatb54){discard;}
    u_xlat22.xyz = _DissolveColor.www * _DissolveColor.xyz;
    u_xlat22.xyz = u_xlat22.xyz * vec3(_DissolveColor_Power);
    u_xlat28.x = (-u_xlat28.x) + 1.0;
    u_xlat78 = log2(u_xlat78);
    u_xlat54 = u_xlat78 * _Fres_Power;
    u_xlat54 = exp2(u_xlat54);
    u_xlat54 = max(u_xlat54, 0.00999999978);
    u_xlat54 = u_xlat54 * _Fres_Sacle;
    u_xlat78 = u_xlat78 * _Fres_Power2;
    u_xlat78 = exp2(u_xlat78);
    u_xlat78 = max(u_xlat78, 0.00999999978);
    u_xlat78 = u_xlat78 * _Fres_Sacle2;
    u_xlat23.xyz = vec3(u_xlat78) * _FresColor2.xyz;
    u_xlat24.xyz = vec3(u_xlat54) * _FresColor.xyz + (-u_xlat23.xyz);
    u_xlat23.xyz = vec3(_ChangeMainTex) * u_xlat24.xyz + u_xlat23.xyz;
    u_xlat10_5 = texture2D(_EmissionTex, vs_TEXCOORD0.xy);
    u_xlat24.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat24.xyz = u_xlat10_5.xyz * u_xlat24.xyz;
    u_xlat78 = max(_Em_Intensity, 0.0);
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat78);
    u_xlat78 = _Time.y * _Em_Speed;
    u_xlat78 = sin(u_xlat78);
    u_xlat24.xyz = (-u_xlat24.xyz) * abs(vec3(u_xlat78)) + u_xlat24.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _DirectionalLight_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Cube_Intensity);
    u_xlat0.xyz = u_xlat21.xyz * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat78 = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat78 = u_xlat78 * _AdditionalRefAlpha;
    u_xlat78 = u_xlat1.w * _Alpha + u_xlat78;
    u_xlat3.w = min(u_xlat78, 1.0);
    u_xlat19.xyz = u_xlat19.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat19.xyz * u_xlat2.xxx + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xyz + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat22.xyz * u_xlat28.xxx + u_xlat4.xyz;
    u_xlat2.xyz = u_xlat1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat23.xyz * u_xlat10_5.www + u_xlat24.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat80) + u_xlat2.xyz;
    u_xlat16_9.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_9.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(vec3(_Intensity, _Intensity, _Intensity));
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_Directional_Sanshe" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 120872
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
}
}
}
}