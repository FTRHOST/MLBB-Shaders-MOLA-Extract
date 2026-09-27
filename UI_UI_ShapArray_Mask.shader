//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UI_ShapArray_Mask" {
Properties {

_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)

_UI_Texture ("UI_Texture", 2D) = "white" { }

_All_Scale ("整体缩放", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_Y_Tiling ("Y_重复度", Float) = 2.0

_X_Tiling ("X_重复度", Float) = 2.0

[Toggle] _UseDouBleTex ("图片错层", Float) = 0.0

_X_Offset ("X_偏移", Float) = 0.5

_Y_Offset ("Y_偏移", Float) = 0.5

_Mask ("Mask", 2D) = "white" { }

[Toggle] _MaskR_isClamp ("R遮罩设为Clamp", Float) = 0.0

_MaskR_TiOf ("R遮罩 XY:重复度 ZW:偏移", Vector) = (1,1,0,0)

_Mask_Power ("R遮罩强度", Range(0, 5)) = 0.0

[Toggle] _UseG ("G使用扭曲图", Float) = 1.0

_MaskG_TiSp ("G扭曲图 XY:重复度 ZW:流速", Vector) = (1,1,0,0)

_Noise_Speed ("G扭曲速度", Float) = 1.0

_Noise_MinSize ("G最小Size", Float) = 0.8999999761581421

_Noise_MaxSize ("G最大Size", Float) = 1.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 50886
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _UI_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat16_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat16_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat16_1 = texture(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat16_8 = texture(_Diffuse, u_xlat0.zw).x;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat16_0 + u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat4.xy = abs(u_xlat4.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _UI_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat16_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat16_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat16_1 = texture(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat16_8 = texture(_Diffuse, u_xlat0.zw).x;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat16_0 + u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat4.xy = abs(u_xlat4.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _UI_Texture;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
lowp float u_xlat10_5;
vec2 u_xlat8;
lowp float u_xlat10_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat10_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat10_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat10_1 = texture2D(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat0.zw).x;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat10_0 + u_xlat10_8;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat4.xy = abs(u_xlat4.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _UI_Texture;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
lowp float u_xlat10_5;
vec2 u_xlat8;
lowp float u_xlat10_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat10_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat10_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat10_1 = texture2D(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat0.zw).x;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat10_0 + u_xlat10_8;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat4.xy = abs(u_xlat4.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _UI_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat16_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat16_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat16_1 = texture(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat16_8 = texture(_Diffuse, u_xlat0.zw).x;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat16_0 + u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat16_3.xy = abs(u_xlat4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _UI_Texture;
UNITY_LOCATION(2) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat16_1.x = texture(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat16_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat16_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat16_1 = texture(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat16_1 * _DiffuseColor;
    u_xlat16_8 = texture(_Diffuse, u_xlat0.zw).x;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat16_0 + u_xlat16_8;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat16_3.xy = abs(u_xlat4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _UI_Texture;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
lowp float u_xlat10_5;
vec2 u_xlat8;
lowp float u_xlat10_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat10_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat10_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat10_1 = texture2D(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat0.zw).x;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat10_0 + u_xlat10_8;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat16_3.xy = abs(u_xlat4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _UI_Texture_ST;
uniform 	vec4 _DiffuseColor;
uniform 	float _X_Tiling;
uniform 	float _Y_Tiling;
uniform 	float _All_Scale;
uniform 	vec4 _MaskR_TiOf;
uniform 	vec4 _MaskG_TiSp;
uniform 	float _MaskR_isClamp;
uniform 	float _Mask_Power;
uniform 	float _UseG;
uniform 	float _Noise_MinSize;
uniform 	float _Noise_MaxSize;
uniform 	float _UseDouBleTex;
uniform 	float _X_Offset;
uniform 	float _Y_Offset;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _UI_Texture;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
vec2 u_xlat5;
lowp float u_xlat10_5;
vec2 u_xlat8;
lowp float u_xlat10_8;
vec2 u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(_X_Tiling, _Y_Tiling);
    u_xlat8.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlatb1.xy = equal(vec4(_UseG, _MaskR_isClamp, _UseG, _UseG), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    if(u_xlatb1.x){
        u_xlat1.xz = floor(u_xlat8.xy);
        u_xlat1.xz = u_xlat1.xz * _MaskG_TiSp.xy;
        u_xlat1.xz = u_xlat1.xz * vec2(0.00392156886, 0.00392156886);
        u_xlat1.xz = _Time.yy * _MaskG_TiSp.zw + u_xlat1.xz;
        u_xlat10_1.x = texture2D(_Mask, u_xlat1.xz).y;
        u_xlat9.x = (-_Noise_MinSize) + _Noise_MaxSize;
        u_xlat1.x = u_xlat10_1.x * u_xlat9.x + _Noise_MinSize;
    } else {
        u_xlat1.x = 1.0;
    }
    u_xlat9.xy = vs_TEXCOORD0.xy * _MaskR_TiOf.xy + _MaskR_TiOf.zw;
    u_xlat2.xy = max(u_xlat9.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat2.xy = min(u_xlat2.xy, vec2(0.999000013, 0.999000013));
    u_xlat5.xy = (u_xlatb1.y) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat5.x = u_xlat10_5 * _Mask_Power;
    u_xlat5.x = u_xlat5.x * _All_Scale;
    u_xlat1.x = u_xlat1.x * u_xlat5.x;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy + vec2(-0.5, -0.5);
    u_xlat8.xy = u_xlat1.xx * u_xlat8.xy;
    u_xlat8.xy = max(u_xlat8.xy, vec2(-0.5, -0.5));
    u_xlat0.zw = min(u_xlat8.xy, vec2(0.5, 0.5));
    u_xlat2.x = u_xlat0.x * 0.5 + _X_Offset;
    u_xlat2.y = u_xlat0.y * 0.5 + _Y_Offset;
    u_xlat0.xy = fract(u_xlat2.xy);
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.xx * u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-0.5, -0.5));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.5, 0.5));
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat1.xy = vs_TEXCOORD0.xy * _UI_Texture_ST.xy + _UI_Texture_ST.zw;
    u_xlat10_1 = texture2D(_UI_Texture, u_xlat1.xy);
    u_xlat1 = u_xlat10_1 * _DiffuseColor;
    u_xlat10_8 = texture2D(_Diffuse, u_xlat0.zw).x;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy).x;
    u_xlat0.x = _UseDouBleTex * u_xlat10_0 + u_xlat10_8;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat1.w;
    u_xlat4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat4.xy = u_xlat4.xy + u_xlat4.xy;
    u_xlat16_3.xy = abs(u_xlat4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_3.x;
    SV_Target0.xyz = u_xlat1.xyz;
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
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
}
}
}
}