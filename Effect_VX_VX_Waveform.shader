//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_Waveform" {
Properties {

_Custom ("Custom_自定义曲线开关(主贴图偏移XY_NGon偏移ZW)", Float) = 0.0

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

_WaveToggle ("_WaveToggle", Vector) = (1,1,0,0)

_WaveVector ("WaveVector", Vector) = (1,0.5,0,1)

_NoiseTex ("R:扰动图 G:溶解纹理 B:溶解遮罩", 2D) = "white" { }

_NoiseVector ("NoiseVector", Vector) = (1,0.1,0,0)

_DISSOLVE_ON ("开启溶解_扰动图G通道", Float) = 0.0

_DissolveEdgeColor ("溶解软边颜色", Color) = (0.146849,0.52261,0.943396,1)

_DissolveVector ("DissolveVector", Vector) = (0,0.1,0.2,4)

_Dissolve_TiSp ("扰动图G通道_XY控Tiling_ZW控速度", Vector) = (1,1,0,0)

_UseDisMask ("开启溶解遮罩_扰动图B通道", Float) = 0.0

_DisMaskVector ("DisMaskVector", Vector) = (0.5,0.5,1,1)

_Mask ("遮罩图", 2D) = "white" { }

_MaskUVToDiffuseUV ("遮罩图使用主图波形UV", Float) = 0.0

_MaskVector ("遮罩图_速度XY_角度Z角速度W", Vector) = (0,0,0,0)

_COLOUR_ON ("色彩开关(禁动画中K开关)", Float) = 0.0

_HSV_Vector ("_HSV_Vector", Vector) = (0,1,1,0)

_BrightColor ("灰度亮部渐变色", Color) = (1,1,1,1)

_DarkColor ("灰度暗部渐变色", Color) = (1,1,1,1)

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_SaturateWeights ("SaturateWeights", Vector) = (1,0,0,0)

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
  GpuProgramID 65267
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat16_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb13 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat16_6 = texture(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat16_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat16_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb13 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat16_6 = texture(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat16_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat10_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlatb13 = 0.5<_NoiseVector.x;
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat10_6 = texture2D(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat10_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat10_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat10_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlatb13 = 0.5<_NoiseVector.x;
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat10_6 = texture2D(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat10_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat10_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat16_12 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat16_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat16_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb19 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat16_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat16_12 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat16_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat16_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb19 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat16_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp float u_xlat10_7;
mediump float u_xlat16_8;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat10_12 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat10_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat10_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlatb19 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat10_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp float u_xlat10_7;
mediump float u_xlat16_8;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat10_12 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat10_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat10_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlatb19 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat10_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb17 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat16_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat16_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat5.y>=u_xlat4.z);
#else
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
#endif
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.x>=u_xlat1.x);
#else
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb17 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat16_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat16_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat5.y>=u_xlat4.z);
#else
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
#endif
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.x>=u_xlat1.x);
#else
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlatb17 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat10_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat10_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlatb17 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat10_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat10_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat16_16 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat16_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb25 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat16_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat5.y>=u_xlat3.z);
#else
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
#endif
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat3.x>=u_xlat0.x);
#else
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat16_16 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat16_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb25 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat16_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat5.y>=u_xlat3.z);
#else
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
#endif
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat3.x>=u_xlat0.x);
#else
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat10_16 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat10_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
    u_xlatb25 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat10_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat5;
float u_xlat6;
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
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat5.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat6 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat6) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat6) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat6 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelRect;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat10_16 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat10_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
    u_xlatb25 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat10_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat16_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb13 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat16_6 = texture(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat16_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat16_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb13 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat16_6 = texture(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat16_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat16_1 = texture(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat16_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat10_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlatb13 = 0.5<_NoiseVector.x;
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat10_6 = texture2D(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat10_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat10_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
mediump vec2 u_xlat16_11;
bool u_xlatb13;
float u_xlat18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat18 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat18 = u_xlat18 * _WaveVector.x;
    u_xlat18 = u_xlat18 * 3.14159012;
    u_xlat18 = sin(u_xlat18);
    u_xlat18 = u_xlat18 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.z = u_xlat18 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat6.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb7 = _MaskUVToDiffuseUV==1.0;
    u_xlat6.xz = (bool(u_xlatb7)) ? u_xlat0.xz : u_xlat6.xz;
    u_xlat0.yw = u_xlat6.xz + vs_TEXCOORD2.zw;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7 = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat7 = u_xlat7 * 0.0174532924;
    u_xlat2.x = sin((-u_xlat7));
    u_xlat3.x = sin(u_xlat7);
    u_xlat4 = cos(u_xlat7);
    u_xlat2.y = u_xlat4;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.zy, u_xlat0.yw);
    u_xlat3.x = dot(u_xlat2.yx, u_xlat0.yw);
    u_xlat6.xz = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7 = u_xlat10_7 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlatb13 = 0.5<_NoiseVector.x;
    u_xlat16_5.x = (u_xlatb13) ? u_xlat1.x : u_xlat7;
    u_xlat1.xy = _Time.yy * _MaskVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy + u_xlat16_5.xx;
    u_xlat6.xz = u_xlat6.xz + u_xlat1.xy;
    u_xlat10_6 = texture2D(_Mask, u_xlat6.xz).x;
    u_xlat6.x = u_xlat10_6 * _AlphaIntensity;
    u_xlat16_11.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat0.xz = u_xlat0.xz / u_xlat16_11.xy;
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD2.xy;
    u_xlat0.xz = u_xlat0.xz + vec2(0.5, 0.5);
    u_xlat0.xz = u_xlat0.xz + (-_MainTex_RotateVec.xy);
    u_xlat18 = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat18 = u_xlat18 * 0.0174532924;
    u_xlat1.x = sin((-u_xlat18));
    u_xlat2.x = sin(u_xlat18);
    u_xlat3.x = cos(u_xlat18);
    u_xlat1.y = u_xlat3.x;
    u_xlat1.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat1.zy, u_xlat0.xz);
    u_xlat2.x = dot(u_xlat1.yx, u_xlat0.xz);
    u_xlat0.xz = u_xlat2.xy + _MainTex_RotateVec.xy;
    u_xlat1.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xz = u_xlat0.xz + u_xlat1.xy;
    u_xlat0.xz = u_xlat16_5.xx + u_xlat0.xz;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat0.xz);
    u_xlat2 = vs_COLOR0 * _DiffuseColor;
    u_xlat1 = u_xlat10_1 * u_xlat2;
    u_xlat0.x = u_xlat6.x * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat16_12 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat16_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat16_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb19 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat16_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat16_12 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat16_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat16_7 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat16_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb19 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat16_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp float u_xlat10_7;
mediump float u_xlat16_8;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat10_12 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat10_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat10_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlatb19 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat10_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
lowp float u_xlat10_7;
mediump float u_xlat16_8;
float u_xlat12;
lowp float u_xlat10_12;
vec2 u_xlat13;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat6.x = float(_UseDisMask);
    u_xlat10_12 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat6.x = (-u_xlat6.x) * u_xlat10_12 + 1.0;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat6.x;
    u_xlat6.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat6.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat6.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat6.x = u_xlat6.x * _WaveVector.x;
    u_xlat6.x = u_xlat6.x * 3.14159012;
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * _WaveVector.y;
    u_xlat12 = u_xlat1.x + (-_WaveVector.z);
    u_xlat12 = abs(u_xlat12) + -1.0;
    u_xlat12 = _WaveVector.w * u_xlat12 + 1.0;
    u_xlat6.x = u_xlat12 * u_xlat6.x;
    u_xlat1.z = u_xlat6.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat6.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat6.xz = u_xlat6.xz / u_xlat16_2.xy;
    u_xlat6.xz = u_xlat6.xz + vs_TEXCOORD2.xy;
    u_xlat6.xz = u_xlat6.xz + vec2(0.5, 0.5);
    u_xlat6.xz = u_xlat6.xz + (-_MainTex_RotateVec.xy);
    u_xlat7.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat7.x = u_xlat7.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat7.x));
    u_xlat4.x = sin(u_xlat7.x);
    u_xlat5 = cos(u_xlat7.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat6.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat6.xz);
    u_xlat6.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat7.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat7.xz = fract(u_xlat7.xz);
    u_xlat6.xz = u_xlat6.xz + u_xlat7.xz;
    u_xlat10_7 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat7.x = u_xlat10_7 * _NoiseVector.y;
    u_xlat12 = u_xlat12 * u_xlat7.x;
    u_xlatb19 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb19) ? u_xlat12 : u_xlat7.x;
    u_xlat6.xy = u_xlat6.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat6.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_8 = (-u_xlat6.x) + 1.0;
    u_xlat6.x = u_xlat6.x + (-u_xlat16_8);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_8);
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat12 = u_xlat0.x * u_xlat6.x;
    u_xlat16_8 = (-u_xlat6.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_8);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = log2(u_xlat12);
    u_xlat6.x = u_xlat6.x * _DissolveVector.w;
    u_xlat6.x = exp2(u_xlat6.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat6.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat3 = u_xlat10_3 * u_xlat4;
    u_xlat3.w = u_xlat0.x * u_xlat3.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat7.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb3 = _MaskUVToDiffuseUV==1.0;
    u_xlat1.xy = (bool(u_xlatb3)) ? u_xlat1.xz : u_xlat7.xz;
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD2.zw;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat13.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat13.x = u_xlat13.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat13.x));
    u_xlat4.x = sin(u_xlat13.x);
    u_xlat5 = cos(u_xlat13.x);
    u_xlat3.y = u_xlat5;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat1.xy);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat1.xy);
    u_xlat1.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat13.xy = _Time.yy * _MaskVector.xy;
    u_xlat13.xy = fract(u_xlat13.xy);
    u_xlat13.xy = u_xlat13.xy + u_xlat16_2.xx;
    u_xlat1.xy = u_xlat13.xy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1 * _AlphaIntensity;
    u_xlat18 = u_xlat0.w * u_xlat1.x;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat18 * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb17 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat16_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat16_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat5.y>=u_xlat4.z);
#else
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
#endif
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.x>=u_xlat1.x);
#else
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb17 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_1 = texture(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat16_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat16_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat5.y>=u_xlat4.z);
#else
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
#endif
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat4.x>=u_xlat1.x);
#else
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlatb17 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat10_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat10_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
float u_xlat24;
bool u_xlatb24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat24 = _Time.y * _WaveToggle.xxxy.w + u_xlat0.x;
    u_xlat24 = u_xlat24 * _WaveVector.x;
    u_xlat24 = u_xlat24 * 3.14159012;
    u_xlat24 = sin(u_xlat24);
    u_xlat24 = u_xlat24 * _WaveVector.y;
    u_xlat1.x = u_xlat0.x + (-_WaveVector.z);
    u_xlat1.x = abs(u_xlat1.x) + -1.0;
    u_xlat1.x = _WaveVector.w * u_xlat1.x + 1.0;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat0.z = u_xlat24 * _WaveToggle.xxxy.z + u_xlat0.y;
    u_xlat8.xz = u_xlat0.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xy = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xy = fract(u_xlat9.xy);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xy;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat1.x = u_xlat1.x * u_xlat9.x;
    u_xlatb17 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb17) ? u_xlat1.x : u_xlat9.x;
    u_xlat8.xz = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat8.xz);
    u_xlat3 = vs_COLOR0 * _DiffuseColor;
    u_xlat4 = u_xlat10_1 * u_xlat3;
    u_xlat5.xy = u_xlat4.zy;
    u_xlat3.xy = u_xlat10_1.yz * u_xlat3.yz + (-u_xlat5.xy);
    u_xlat16_10.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlatb8 = u_xlat5.y>=u_xlat4.z;
    u_xlat16_18.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_18.xxxx * u_xlat3.xywz + u_xlat5.xywz;
    u_xlatb8 = u_xlat4.x>=u_xlat1.x;
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat4.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = u_xlat8.xxxx * u_xlat3 + u_xlat1;
    u_xlat8.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat8.x = (-u_xlat8.x) + u_xlat1.x;
    u_xlat24 = u_xlat8.x * 6.0 + 1.00000001e-10;
    u_xlat9.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat24 = u_xlat9.x / u_xlat24;
    u_xlat24 = u_xlat24 + u_xlat1.z;
    u_xlat16_18.x = abs(u_xlat24) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb24 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb24)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat9.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat24 = u_xlat1.x + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat16_18.x = u_xlat8.x * _HSV_Vector.y;
    u_xlat9.xyz = u_xlat16_18.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat9.xyz * u_xlat1.xxx;
    u_xlat16_6.xyz = u_xlat1.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat8.xz = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb1 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb1)) ? u_xlat0.xz : u_xlat8.xz;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat4.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat16_16 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat16_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb25 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat16_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat5.y>=u_xlat3.z);
#else
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
#endif
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat3.x>=u_xlat0.x);
#else
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
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
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
mediump float u_xlat16_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0 = texture(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat16_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat16_16 = texture(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat16_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat16_9 = texture(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat16_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(0.5<_NoiseVector.x);
#else
    u_xlatb25 = 0.5<_NoiseVector.x;
#endif
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat16_3 = texture(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat16_3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat16_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat16_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat5.y>=u_xlat3.z);
#else
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
#endif
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat3.x>=u_xlat0.x);
#else
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
#endif
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_26>=(-u_xlat16_26));
#else
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
#endif
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_MaskUVToDiffuseUV==1.0);
#else
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
#endif
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat10_16 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat10_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
    u_xlatb25 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat10_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _Custom;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseVector;
uniform 	vec4 _Dissolve_TiSp;
uniform 	vec4 _DisMaskVector;
uniform 	vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _NoiseVector.zw;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat7.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    vs_TEXCOORD1.zw = u_xlat1.xy + u_xlat7.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat9 = float(_Custom);
    vs_TEXCOORD2 = vec4(u_xlat9) * in_TEXCOORD1;
    u_xlat1.xy = in_TEXCOORD2.xy * vec2(u_xlat9) + in_TEXCOORD0.xy;
    u_xlat0.z = u_xlat9 * in_TEXCOORD2.z;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat0.xy = u_xlat1.xy + (-_DisMaskVector.xy);
    u_xlat0.xy = u_xlat0.xy / _DisMaskVector.zw;
    vs_TEXCOORD3.xy = u_xlat0.xy + _DisMaskVector.xy;
    u_xlat0.xy = _Time.yy * _Dissolve_TiSp.zw;
    u_xlat0.xy = fract(u_xlat0.xy);
    vs_TEXCOORD3.zw = in_TEXCOORD0.xy * _Dissolve_TiSp.xy + u_xlat0.xy;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _MainTex_ScaleSp;
uniform 	vec4 _MainTex_RotateVec;
uniform 	vec4 _DiffuseColor;
uniform 	float _AlphaIntensity;
uniform 	vec2 _WaveToggle;
uniform 	vec4 _WaveVector;
uniform 	vec4 _NoiseVector;
uniform 	float _MaskUVToDiffuseUV;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _MaskVector;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	vec4 _DissolveVector;
uniform 	int _UseDisMask;
uniform 	vec4 _PanelClipInfo;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
vec2 u_xlat16;
lowp float u_xlat10_16;
bool u_xlatb16;
mediump vec2 u_xlat16_18;
float u_xlat25;
bool u_xlatb25;
mediump float u_xlat16_26;
void main()
{
    u_xlat10_0 = texture2D(_NoiseTex, vs_TEXCOORD3.zw).y;
    u_xlat0.x = (-u_xlat10_0) + 1.0;
    u_xlat8.x = float(_UseDisMask);
    u_xlat10_16 = texture2D(_NoiseTex, vs_TEXCOORD3.xy).z;
    u_xlat8.x = (-u_xlat8.x) * u_xlat10_16 + 1.0;
    u_xlat0.x = (-u_xlat8.x) + u_xlat0.x;
    u_xlat0.x = _DissolveVector.z * u_xlat0.x + u_xlat8.x;
    u_xlat8.x = vs_TEXCOORD4.z + _DissolveVector.x;
    u_xlat0.x = u_xlat8.x + u_xlat0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat8.x = _Time.y * _WaveToggle.xxxy.w + u_xlat1.x;
    u_xlat8.x = u_xlat8.x * _WaveVector.x;
    u_xlat8.x = u_xlat8.x * 3.14159012;
    u_xlat8.x = sin(u_xlat8.x);
    u_xlat8.x = u_xlat8.x * _WaveVector.y;
    u_xlat16.x = u_xlat1.x + (-_WaveVector.z);
    u_xlat16.x = abs(u_xlat16.x) + -1.0;
    u_xlat16.x = _WaveVector.w * u_xlat16.x + 1.0;
    u_xlat8.x = u_xlat16.x * u_xlat8.x;
    u_xlat1.z = u_xlat8.x * _WaveToggle.xxxy.z + u_xlat1.y;
    u_xlat8.xz = u_xlat1.xz + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(_MainTex_ScaleSp.xy, vec2(9.99999975e-05, 9.99999975e-05));
    u_xlat8.xz = u_xlat8.xz / u_xlat16_2.xy;
    u_xlat8.xz = u_xlat8.xz + vs_TEXCOORD2.xy;
    u_xlat8.xz = u_xlat8.xz + vec2(0.5, 0.5);
    u_xlat8.xz = u_xlat8.xz + (-_MainTex_RotateVec.xy);
    u_xlat9.x = _MainTex_RotateVec.w * _Time.y + _MainTex_RotateVec.z;
    u_xlat9.x = u_xlat9.x * 0.0174532924;
    u_xlat3.x = sin((-u_xlat9.x));
    u_xlat4.x = sin(u_xlat9.x);
    u_xlat5.x = cos(u_xlat9.x);
    u_xlat3.y = u_xlat5.x;
    u_xlat3.z = u_xlat4.x;
    u_xlat4.y = dot(u_xlat3.zy, u_xlat8.xz);
    u_xlat4.x = dot(u_xlat3.yx, u_xlat8.xz);
    u_xlat8.xz = u_xlat4.xy + _MainTex_RotateVec.xy;
    u_xlat9.xz = _Time.yy * _MainTex_ScaleSp.zw;
    u_xlat9.xz = fract(u_xlat9.xz);
    u_xlat8.xz = u_xlat8.xz + u_xlat9.xz;
    u_xlat10_9 = texture2D(_NoiseTex, vs_TEXCOORD1.zw).x;
    u_xlat9.x = u_xlat10_9 * _NoiseVector.y;
    u_xlat16.x = u_xlat16.x * u_xlat9.x;
    u_xlatb25 = 0.5<_NoiseVector.x;
    u_xlat16_2.x = (u_xlatb25) ? u_xlat16.x : u_xlat9.x;
    u_xlat8.xy = u_xlat8.xz + u_xlat16_2.xx;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat8.xy);
    u_xlat0.x = (-u_xlat0.x) + u_xlat10_3.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = _DissolveVector.y * 0.5 + 0.5;
    u_xlat16_10.x = (-u_xlat8.x) + 1.0;
    u_xlat8.x = u_xlat8.x + (-u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x + (-u_xlat16_10.x);
    u_xlat8.x = float(1.0) / u_xlat8.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.x = u_xlat0.x * u_xlat8.x;
    u_xlat16_10.x = (-u_xlat8.x) * u_xlat0.x + 1.0;
    u_xlat0.x = log2(u_xlat16_10.x);
    u_xlat0.x = u_xlat0.x * _DissolveVector.w;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = log2(u_xlat16.x);
    u_xlat8.x = u_xlat8.x * _DissolveVector.w;
    u_xlat8.x = exp2(u_xlat8.x);
    u_xlat4 = (-_DissolveEdgeColor) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat4 = u_xlat8.xxxx * u_xlat4 + _DissolveEdgeColor;
    u_xlat4 = u_xlat10_3 * u_xlat4;
    u_xlat16_10.x = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_10.x = u_xlat16_10.x + (-_SaturateWeights.y);
    u_xlat4.w = u_xlat0.x * u_xlat4.w;
    u_xlat0 = vs_COLOR0 * _DiffuseColor;
    u_xlat3 = u_xlat0 * u_xlat4;
    u_xlat5.xy = u_xlat3.zy;
    u_xlat0.xy = u_xlat4.yz * u_xlat0.yz + (-u_xlat5.xy);
    u_xlatb9 = u_xlat5.y>=u_xlat3.z;
    u_xlat16_18.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat5.z = float(-1.0);
    u_xlat5.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_18.xxxx * u_xlat0.xywz + u_xlat5.xywz;
    u_xlatb9 = u_xlat3.x>=u_xlat0.x;
    u_xlat9.x = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat0.w;
    u_xlat0.w = u_xlat3.x;
    u_xlat4.xyw = u_xlat0.wyx;
    u_xlat4 = (-u_xlat0) + u_xlat4;
    u_xlat0 = u_xlat9.xxxx * u_xlat4 + u_xlat0;
    u_xlat9.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat9.x = u_xlat0.x + (-u_xlat9.x);
    u_xlat25 = u_xlat9.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat8.x = u_xlat8.x / u_xlat25;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_18.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_26 = u_xlat16_18.x * 360.0;
    u_xlatb8 = u_xlat16_26>=(-u_xlat16_26);
    u_xlat16_6.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_6.y;
    u_xlat16_18.x = fract(u_xlat16_18.x);
    u_xlat8.xyz = u_xlat16_6.xxx * u_xlat16_18.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat25 = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat25;
    u_xlat16_18.x = u_xlat9.x * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_18.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_18.xy = (-_SaturateWeights.yz) + _SaturateWeights.xw;
    u_xlat16_18.xy = vec2(1.0, 1.0) / u_xlat16_18.xy;
    u_xlat16_10.x = u_xlat16_18.x * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = _BrightColor.xyz + (-_DarkColor.xyz);
    u_xlat16_7.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _DarkColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_10.x = vs_TEXCOORD1.x + (-_SaturateWeights.z);
    u_xlat16_10.x = u_xlat16_18.y * u_xlat16_10.x;
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
    u_xlat16_18.x = u_xlat16_10.x * -2.0 + 3.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_18.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_10.xyz * u_xlat16_6.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlatb16 = _MaskUVToDiffuseUV==1.0;
    u_xlat0.xy = (bool(u_xlatb16)) ? u_xlat1.xz : u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD2.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat16.x = _MaskVector.w * _Time.y + _MaskVector.z;
    u_xlat16.x = u_xlat16.x * 0.0174532924;
    u_xlat1.x = sin((-u_xlat16.x));
    u_xlat3.x = sin(u_xlat16.x);
    u_xlat4.x = cos(u_xlat16.x);
    u_xlat1.y = u_xlat4.x;
    u_xlat1.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat1.zy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yx, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16.xy = _Time.yy * _MaskVector.xy;
    u_xlat16.xy = fract(u_xlat16.xy);
    u_xlat16.xy = u_xlat16.xy + u_xlat16_2.xx;
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _AlphaIntensity;
    u_xlat0.x = u_xlat0.x * u_xlat3.w;
    u_xlat16_2.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
Local Keywords { "_DISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_DISSOLVE_ON" }
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
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
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
Local Keywords { "_DISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_DISSOLVE_ON" }
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
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_DISSOLVE_ON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.VX_WaveformGUI_Custom"
}