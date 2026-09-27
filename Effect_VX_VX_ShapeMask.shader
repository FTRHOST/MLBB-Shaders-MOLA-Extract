//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_ShapeMask" {
Properties {

[Toggle] _Custom ("Custom_自定义曲线开关(主贴图偏移XY_NGon偏移ZW)", Float) = 0.0

_Cull ("剔除模式", Float) = 2.0

_ZWrite ("深度写入", Float) = 0.0

_ZTest ("深度测试", Float) = 4.0

_BlendSrc ("BlendSrc_混合源颜色系数", Float) = 5.0

_BlendDst ("BlendDst_混合目标色系数", Float) = 10.0

_Diffuse ("主贴图", 2D) = "white" { }

_DiffuseColor ("主颜色", Color) = (1,1,1,1)

_AlphaIntensity ("Alpha强度", Range(0, 10)) = 1.0

_MainTex_ScaleSp ("主贴图_缩放xy速度ZW", Vector) = (1,1,0,0)

_MainTex_RotateVec ("主贴图旋转_锚点XY_角度Z速度W", Vector) = (0.5,0.5,0,0)

_Color1 ("内部颜色", Color) = (1,1,1,1)

_Color0 ("软边颜色", Color) = (0,0.7,1,1)

_Ngon_RepeatRotate ("Repeat_Rotate", Vector) = (1,1,0,0)

_Ngon_ShapeVector ("ShapeVector", Vector) = (3,0.5,1,1)

_NGon_EdgeSpeed ("Edge_Speed", Vector) = (0.2,1,0,0)

_Radian_Corner ("边弧度_圆角", Vector) = (1,0.1,0,0)

_NGon_TiOf ("多边形_平铺XY_偏移ZW", Vector) = (1,1,0,0)

_HSV_Vector ("_HSV_Vector", Vector) = (0,1,1,0)

_BrightColor ("灰度亮部渐变色", Color) = (1,1,1,1)

_DarkColor ("灰度暗部渐变色", Color) = (1,1,1,1)

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_SaturateWeights ("SaturateWeights", Vector) = (1,0,0,1)

_PanelRect ("PanelRect", Vector) = (0,0,1,1)

_PanelClipInfo ("PanelClipInfo", Vector) = (1,1,1,1)

_Stencil_Ref ("StencilRef", Float) = 0.0

_Stencil_Comp ("Stencil_Comp", Float) = 8.0

_TempParameter1 ("临时参数1", Vector) = (0,0,1,1)

_TempParameter2 ("临时参数2", Vector) = (0,0,1,1)

_TempParameter3 ("临时参数3", Vector) = (0,0,1,1)

_TempParameter4 ("临时参数4", Vector) = (0,0,1,1)

_TempParameter5 ("临时参数5", Vector) = (0,0,1,1)

_TempParameter6 ("临时参数6", Vector) = (0,0,1,1)

_TempTex1 ("临时贴图1", 2D) = "white" { }

_TempTex2 ("临时贴图2", 2D) = "white" { }

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 52838
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5>=0.0);
#else
    u_xlatb5 = u_xlat5>=0.0;
#endif
    u_xlat10.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5>=0.0);
#else
    u_xlatb5 = u_xlat5>=0.0;
#endif
    u_xlat10.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
    u_xlatb5 = u_xlat5>=0.0;
    u_xlat10.x = u_xlat0.x;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
    u_xlatb5 = u_xlat5>=0.0;
    u_xlat10.x = u_xlat0.x;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.0);
#else
    u_xlatb9 = u_xlat9.x>=0.0;
#endif
    u_xlat18.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat5.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_22.x>=(-u_xlat16_22.x));
#else
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.0);
#else
    u_xlatb9 = u_xlat9.x>=0.0;
#endif
    u_xlat18.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat5.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_22.x>=(-u_xlat16_22.x));
#else
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
    u_xlatb9 = u_xlat9.x>=0.0;
    u_xlat18.x = u_xlat0.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
    u_xlatb9 = u_xlat9.x>=0.0;
    u_xlat18.x = u_xlat0.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<(-u_xlat9.x));
#else
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
#endif
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=(-u_xlat18.x));
#else
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
#endif
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat4.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_24.x>=(-u_xlat16_24.x));
#else
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<(-u_xlat9.x));
#else
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
#endif
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=(-u_xlat18.x));
#else
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
#endif
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat4.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_24.x>=(-u_xlat16_24.x));
#else
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
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
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5>=0.0);
#else
    u_xlatb5 = u_xlat5>=0.0;
#endif
    u_xlat10.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat5>=0.0);
#else
    u_xlatb5 = u_xlat5>=0.0;
#endif
    u_xlat10.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
    u_xlatb5 = u_xlat5>=0.0;
    u_xlat10.x = u_xlat0.x;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec2 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat10.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat10.xy;
    u_xlat10.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat10.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat10.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat10.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat10.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat10.x = min(u_xlat10.y, u_xlat10.x);
    u_xlat15 = abs(_Radian_Corner.y) * 0.5;
    u_xlat10.x = min(u_xlat15, u_xlat10.x);
    u_xlat0.xy = u_xlat10.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlatb5 = _NGon_EdgeSpeed.x==0.0;
    u_xlat5 = (u_xlatb5) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat5);
    u_xlatb5 = u_xlat5>=0.0;
    u_xlat10.x = u_xlat0.x;
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb5) ? u_xlat0.x : u_xlat10.x;
    u_xlat5 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat5 = log2(u_xlat5);
    u_xlat5 = u_xlat5 * _NGon_EdgeSpeed.y;
    u_xlat5 = exp2(u_xlat5);
    u_xlat5 = (-u_xlat5) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat5 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.0);
#else
    u_xlatb9 = u_xlat9.x>=0.0;
#endif
    u_xlat18.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat5.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_22.x>=(-u_xlat16_22.x));
#else
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.0);
#else
    u_xlatb9 = u_xlat9.x>=0.0;
#endif
    u_xlat18.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat5.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_22.x>=(-u_xlat16_22.x));
#else
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
#endif
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
    u_xlatb9 = u_xlat9.x>=0.0;
    u_xlat18.x = u_xlat0.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_13;
vec2 u_xlat18;
mediump vec2 u_xlat16_22;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_31;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18.x));
    u_xlat2.x = sin(u_xlat18.x);
    u_xlat3 = cos(u_xlat18.x);
    u_xlat1.y = u_xlat3;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = (-_Ngon_ShapeVector.yy) * _Ngon_ShapeVector.zw + abs(u_xlat2.xy);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat18.x = min(u_xlat18.y, u_xlat18.x);
    u_xlat27 = abs(_Radian_Corner.y) * 0.5;
    u_xlat18.x = min(u_xlat27, u_xlat18.x);
    u_xlat0.xy = u_xlat18.xx + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.0, 0.0));
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat18.x) + u_xlat0.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat9.x = (u_xlatb9) ? 9.99999975e-05 : _NGon_EdgeSpeed.x;
    u_xlat0.x = u_xlat0.x / abs(u_xlat9.x);
    u_xlatb9 = u_xlat9.x>=0.0;
    u_xlat18.x = u_xlat0.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (u_xlatb9) ? u_xlat0.x : u_xlat18.x;
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_4.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4.x = u_xlat16_4.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_13.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_13.xx;
    u_xlat5.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat5.zw = u_xlat16_13.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat6.xyz = (-u_xlat5.xyw);
    u_xlat6.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat5.yzx + u_xlat6.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat6.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat5.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat5.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_13.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_22.x = u_xlat16_13.x * 360.0;
    u_xlatb9 = u_xlat16_22.x>=(-u_xlat16_22.x);
    u_xlat16_22.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_13.x = u_xlat16_22.y * u_xlat16_13.x;
    u_xlat16_13.x = fract(u_xlat16_13.x);
    u_xlat10.xyz = u_xlat16_22.xxx * u_xlat16_13.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_13.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_13.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_13.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_4.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_4.xyz = u_xlat16_13.xyz * u_xlat16_8.xzw;
    u_xlat16_31 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_31 = u_xlat16_8.y * u_xlat16_31;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_31 * -2.0 + 3.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_31) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_8.xyz;
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_4.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7<(-u_xlat7));
#else
    u_xlatb7 = u_xlat7<(-u_xlat7);
#endif
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
float u_xlat8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat14.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat14.xy;
    u_xlat14.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat14.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat14.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat14.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat8 = u_xlat1.x * 0.5;
    u_xlat8 = cos(u_xlat8);
    u_xlat14.xy = u_xlat14.xy * vec2(u_xlat8);
    u_xlat16_2.xy = max(u_xlat14.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat14.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat14.x = u_xlat14.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat14.x));
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat7 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat7 = u_xlat0.x * u_xlat0.x;
    u_xlat14.x = u_xlat7 * 0.0208350997 + -0.0851330012;
    u_xlat14.x = u_xlat7 * u_xlat14.x + 0.180141002;
    u_xlat14.x = u_xlat7 * u_xlat14.x + -0.330299497;
    u_xlat7 = u_xlat7 * u_xlat14.x + 0.999866009;
    u_xlat14.x = u_xlat7 * u_xlat0.x;
    u_xlat14.x = u_xlat14.x * -2.0 + 1.57079637;
    u_xlatb21 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat14.x = u_xlatb21 ? u_xlat14.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat7 + u_xlat14.x;
    u_xlatb7 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat7 = u_xlatb7 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat7 + u_xlat0.x;
    u_xlat7 = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb7 = u_xlat7<(-u_xlat7);
    u_xlat14.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat21 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat21 = sqrt(u_xlat21);
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlatb7 = u_xlatb14 && u_xlatb7;
    u_xlat0.x = (u_xlatb7) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat7 = u_xlat0.x / u_xlat1.x;
    u_xlat7 = u_xlat7 + 0.5;
    u_xlat7 = floor(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat8) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat8;
    u_xlatb7 = _NGon_EdgeSpeed.x==0.0;
    u_xlat14.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat7 = (u_xlatb7) ? -0.500050008 : (-u_xlat14.x);
    u_xlat0.x = u_xlat0.x * u_xlat21 + u_xlat7;
    u_xlat7 = u_xlat7 * 2.0 + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7 = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _NGon_EdgeSpeed.y;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat7 = log2(u_xlat7);
    u_xlat7 = u_xlat7 * _NGon_EdgeSpeed.y;
    u_xlat7 = exp2(u_xlat7);
    u_xlat7 = (-u_xlat7) + 1.0;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat0.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_2 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_2 = u_xlat16_2 * vs_COLOR0;
    u_xlat16_1 = u_xlat1 * u_xlat16_2;
    u_xlat0.x = u_xlat7 * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<(-u_xlat9.x));
#else
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
#endif
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=(-u_xlat18.x));
#else
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
#endif
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat4.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_24.x>=(-u_xlat16_24.x));
#else
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(abs(u_xlat4.y)<abs(u_xlat4.x));
#else
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
#endif
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!((-u_xlat4.y)<u_xlat4.y);
#else
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
#endif
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<(-u_xlat9.x));
#else
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
#endif
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=(-u_xlat18.x));
#else
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
#endif
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_NGon_EdgeSpeed.x==0.0);
#else
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
#endif
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat16_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat16_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_3.x>=u_xlat4.x);
#else
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_24.x>=(-u_xlat16_24.x));
#else
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
#endif
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33 = min(max(u_xlat16_33, 0.0), 1.0);
#else
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _Diffuse_ST;
uniform 	int _Custom;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
float u_xlat4;
vec2 u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    vs_TEXCOORD2.xy = u_xlat0.xy;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat10.x = float(_Custom);
    u_xlat0.xy = in_TEXCOORD1.xy * u_xlat10.xx + u_xlat0.xy;
    u_xlat1 = u_xlat10.xxxx * in_TEXCOORD1;
    vs_TEXCOORD1 = u_xlat1;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy + (-_MainTex_RotateVec.xy);
    u_xlat10.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat10.x = u_xlat10.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat10.x));
    u_xlat3 = sin(u_xlat10.x);
    u_xlat4 = cos(u_xlat10.x);
    u_xlat1.y = u_xlat4;
    u_xlat1.z = u_xlat3;
    u_xlat10.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat10.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat10.xy + _MainTex_RotateVec.xy;
    u_xlat10.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat10.xy = fract(u_xlat10.xy);
    vs_TEXCOORD0.zw = u_xlat10.xy + u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _BrightColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _Color0;
uniform 	mediump vec4 _Color1;
uniform 	vec4 _NGon_TiOf;
uniform 	vec4 _NGon_EdgeSpeed;
uniform 	vec4 _Ngon_RepeatRotate;
uniform 	vec4 _Ngon_ShapeVector;
uniform 	vec2 _Radian_Corner;
uniform 	mediump vec4 _DiffuseColor;
uniform 	vec4 _PanelClipInfo;
uniform 	mediump float _AlphaIntensity;
uniform lowp sampler2D _Diffuse;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_15;
vec2 u_xlat18;
bool u_xlatb18;
mediump vec2 u_xlat16_24;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_33;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + _NGon_TiOf.zw;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.zw;
    u_xlat18.xy = _Time.yy * _NGon_EdgeSpeed.zw;
    u_xlat18.xy = fract(u_xlat18.xy);
    u_xlat0.xy = u_xlat0.xy * _NGon_TiOf.xy + u_xlat18.xy;
    u_xlat18.xy = fract(u_xlat0.xy);
    u_xlatb1.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _Ngon_RepeatRotate.xyxx).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat18.x : u_xlat0.x;
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat18.y : u_xlat0.y;
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat18.xy = _Ngon_ShapeVector.zw * _Ngon_ShapeVector.yy;
    u_xlat1.x = floor(_Ngon_ShapeVector.x);
    u_xlat1.x = 6.28318548 / u_xlat1.x;
    u_xlat10.x = u_xlat1.x * 0.5;
    u_xlat10.x = cos(u_xlat10.x);
    u_xlat18.xy = u_xlat18.xy * u_xlat10.xx;
    u_xlat16_2.xy = max(u_xlat18.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xy = u_xlat0.xy / u_xlat16_2.xy;
    u_xlat18.x = _Ngon_RepeatRotate.w * _Time.y + _Ngon_RepeatRotate.z;
    u_xlat18.x = u_xlat18.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat18.x));
    u_xlat4.x = sin(u_xlat18.x);
    u_xlat5.x = cos(u_xlat18.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat0.xy);
    u_xlat0.x = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat9.x = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat9.x = u_xlat0.x * u_xlat0.x;
    u_xlat18.x = u_xlat9.x * 0.0208350997 + -0.0851330012;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + 0.180141002;
    u_xlat18.x = u_xlat9.x * u_xlat18.x + -0.330299497;
    u_xlat9.x = u_xlat9.x * u_xlat18.x + 0.999866009;
    u_xlat18.x = u_xlat9.x * u_xlat0.x;
    u_xlat18.x = u_xlat18.x * -2.0 + 1.57079637;
    u_xlatb27 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat18.x = u_xlatb27 ? u_xlat18.x : float(0.0);
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18.x;
    u_xlatb9 = (-u_xlat4.y)<u_xlat4.y;
    u_xlat9.x = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat0.x = u_xlat9.x + u_xlat0.x;
    u_xlat9.x = min((-u_xlat4.y), u_xlat4.x);
    u_xlatb9 = u_xlat9.x<(-u_xlat9.x);
    u_xlat18.x = max((-u_xlat4.y), u_xlat4.x);
    u_xlat27 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat27 = sqrt(u_xlat27);
    u_xlatb18 = u_xlat18.x>=(-u_xlat18.x);
    u_xlatb9 = u_xlatb18 && u_xlatb9;
    u_xlat0.x = (u_xlatb9) ? (-u_xlat0.x) : u_xlat0.x;
    u_xlat9.x = u_xlat0.x / u_xlat1.x;
    u_xlat9.x = u_xlat9.x + 0.5;
    u_xlat9.x = floor(u_xlat9.x);
    u_xlat0.x = u_xlat9.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = (-u_xlat10.x) + u_xlat0.x;
    u_xlat0.x = _Radian_Corner.x * u_xlat0.x + u_xlat10.x;
    u_xlatb9 = _NGon_EdgeSpeed.x==0.0;
    u_xlat18.x = _NGon_EdgeSpeed.x * 0.5 + 0.5;
    u_xlat9.x = (u_xlatb9) ? -0.500050008 : (-u_xlat18.x);
    u_xlat0.x = u_xlat0.x * u_xlat27 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 2.0 + 1.0;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.y = log2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xy * _NGon_EdgeSpeed.yy;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat9.x = exp2(u_xlat0.y);
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat9.xxxx * u_xlat1 + _Color0;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.zw);
    u_xlat16_3 = u_xlat10_2 * _DiffuseColor;
    u_xlat16_6.x = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.x = u_xlat16_6.x + (-_SaturateWeights.y);
    u_xlat16_2 = u_xlat16_3 * vs_COLOR0;
    u_xlat16_3 = u_xlat1 * u_xlat16_2;
    u_xlat9.xy = u_xlat16_2.yz * u_xlat1.yz + (-u_xlat16_3.zy);
    u_xlatb27 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_15.x = (u_xlatb27) ? 1.0 : 0.0;
    u_xlat9.xy = u_xlat9.xy * u_xlat16_15.xx;
    u_xlat4.xy = u_xlat16_2.zy * u_xlat1.zy + u_xlat9.xy;
    u_xlat9.x = float(1.0);
    u_xlat9.y = float(-1.0);
    u_xlat4.zw = u_xlat16_15.xx * u_xlat9.xy + vec2(-1.0, 0.666666687);
    u_xlat5.xyz = (-u_xlat4.xyw);
    u_xlat5.w = (-u_xlat16_3.x);
    u_xlat7.yzw = u_xlat4.yzx + u_xlat5.yzw;
    u_xlat7.x = u_xlat16_2.x * u_xlat1.x + u_xlat5.x;
    u_xlatb9 = u_xlat16_3.x>=u_xlat4.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat9.xxx * u_xlat7.xyz + u_xlat4.xyw;
    u_xlat9.x = u_xlat9.x * u_xlat7.w + u_xlat16_3.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_3.w;
    u_xlat0.x = u_xlat0.x * _AlphaIntensity;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat18.x = min(u_xlat1.y, u_xlat9.x);
    u_xlat9.x = (-u_xlat1.y) + u_xlat9.x;
    u_xlat18.x = (-u_xlat18.x) + u_xlat1.x;
    u_xlat27 = u_xlat18.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat27;
    u_xlat9.x = u_xlat9.x + u_xlat1.z;
    u_xlat16_15.x = abs(u_xlat9.x) + _HSV_Vector.x;
    u_xlat16_24.x = u_xlat16_15.x * 360.0;
    u_xlatb9 = u_xlat16_24.x>=(-u_xlat16_24.x);
    u_xlat16_24.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_15.x = u_xlat16_24.y * u_xlat16_15.x;
    u_xlat16_15.x = fract(u_xlat16_15.x);
    u_xlat10.xyz = u_xlat16_24.xxx * u_xlat16_15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat1.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18.x / u_xlat9.x;
    u_xlat16_15.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_15.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_15.xyz = u_xlat9.xyz * _HSV_Vector.zzz;
    u_xlat16_8.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_8.xy = vec2(1.0, 1.0) / u_xlat16_8.xy;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_8.x;
    u_xlat16_8.xzw = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_8.xzw = u_xlat16_6.xxx * u_xlat16_8.xzw + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_15.xyz * u_xlat16_8.xzw;
    u_xlat16_33 = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_33 = u_xlat16_8.y * u_xlat16_33;
    u_xlat16_33 = clamp(u_xlat16_33, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_33 * -2.0 + 3.0;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_33;
    u_xlat16_33 = u_xlat16_33 * u_xlat16_8.x;
    u_xlat16_8.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_8.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_6.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_6.x;
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
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_NGON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_NGON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.VX_ShapeMaskGUI_Custom"
}